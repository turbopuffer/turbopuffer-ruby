# frozen_string_literal: true

module Turbopuffer
  module Internal
    module Transport
      # @api private
      #
      # Called by the client at fixed points of every request. Custom code installs one
      # with `BaseClient#request_observer=`. A single observer is shared across
      # concurrent requests, so per-request state belongs on the scope returned by
      # `#start`. Anything an observer raises is logged and ignored.
      class RequestObserver
        # rubocop:disable Lint/UnusedMethodArgument

        # @api private
        #
        # Called once per logical request.
        #
        # @param info [Turbopuffer::Internal::Transport::RequestObserver::RequestInfo]
        #
        # @return [Turbopuffer::Internal::Transport::RequestObserver::RequestScope, nil] nil to not observe the request
        def start(info) = nil

        # @api private
        #
        # Observes a single logical request.
        class RequestScope
          # @api private
          #
          # Called before each attempt is sent. Changes to `request[:headers]` only apply to this attempt.
          #
          # @param attempt [Integer] 0-based
          # @param request [Hash{Symbol=>Object}] `:method`, `:url`, `:headers` and `:body`
          def attempt_begin(attempt, request) = nil

          # @api private
          #
          # Called after each attempt, success or failure.
          #
          # @param result [Turbopuffer::Internal::Transport::RequestObserver::AttemptResult]
          def attempt_end(result) = nil

          # @api private
          #
          # Called at most once, after the response is parsed or when the request fails for good.
          # Streamed responses don't finish.
          #
          # @param result [Turbopuffer::Internal::Transport::RequestObserver::RequestResult]
          def finish(result) = nil
        end

        # rubocop:enable Lint/UnusedMethodArgument

        # @api private
        #
        # @!attribute method
        #   @return [Symbol]
        #
        # @!attribute url
        #   The request path, e.g. `/v2/namespaces/a/query`.
        #   @return [String]
        RequestInfo = Data.define(:method, :url)

        # @api private
        #
        # `error_kind` is one of `:pool_timeout`, `:connect_timeout`, `:connect_error`, `:write_timeout`,
        # `:read_timeout`, `:read_error`, `:timeout`, `:canceled` or `:other`, and nil without an error.
        # `reached_server` is false when the attempt certainly never reached the server, true when a
        # response arrived, and nil when unknown.
        #
        # @!attribute attempt
        #   @return [Integer]
        #
        # @!attribute request
        #   @return [Hash{Symbol=>Object}]
        #
        # @!attribute response
        #   @return [Net::HTTPResponse, nil]
        #
        # @!attribute error
        #   @return [Exception, nil]
        #
        # @!attribute error_kind
        #   @return [Symbol, nil]
        #
        # @!attribute reached_server
        #   @return [Boolean, nil]
        #
        # @!attribute timings
        #   @return [Turbopuffer::Internal::Transport::RequestObserver::Timings]
        AttemptResult = Data.define(
          :attempt,
          :request,
          :response,
          :error,
          :error_kind,
          :reached_server,
          :timings
        )

        # @api private
        #
        # `error_kind` is nil for HTTP status errors, which the response describes.
        #
        # @!attribute retries
        #   @return [Integer]
        #
        # @!attribute response
        #   @return [Net::HTTPResponse, nil]
        #
        # @!attribute error
        #   @return [Exception, nil]
        #
        # @!attribute error_kind
        #   @return [Symbol, nil]
        #
        # @!attribute parsed
        #   @return [Object, nil]
        #
        # @!attribute timings
        #   @return [Turbopuffer::Internal::Transport::RequestObserver::Timings]
        RequestResult = Data.define(:retries, :response, :error, :error_kind, :parsed, :timings)

        # @api private
        #
        # Monotonic timestamps of one attempt in integer nanoseconds, from `RequestObserver.now`. A field
        # stays nil when its phase didn't happen or couldn't be observed. `extra` holds marks added by
        # custom code.
        class Timings
          # @return [Integer, nil]
          attr_accessor :attempt_start,
                        :serialize_start,
                        :serialize_end,
                        :request_ready,
                        :connect_start,
                        :connect_end,
                        :send_start,
                        :send_end,
                        :response_headers,
                        :body_end,
                        :deserialize_start,
                        :deserialize_end

          # Whether the attempt used an existing connection, nil when unknown.
          #
          # @return [Boolean, nil]
          attr_accessor :reused

          # @return [Hash{Symbol=>Object}]
          attr_reader :extra

          # @api private
          def initialize
            @extra = {}
          end
        end

        # @api private
        CONNECT_ERRORS = [
          Net::OpenTimeout,
          SocketError,
          Errno::ECONNREFUSED,
          Errno::EHOSTUNREACH,
          Errno::ENETUNREACH
        ].freeze

        class << self
          # @api private
          #
          # @return [Integer]
          def now = Process.clock_gettime(Process::CLOCK_MONOTONIC, :nanosecond)

          # @api private
          #
          # @param hook [Symbol]
          # @param blk [Proc]
          #
          # @return [Object, nil]
          def call_safely(hook, &blk)
            blk.call
          rescue StandardError => e
            warn("Turbopuffer: request observer raised in `#{hook}`: #{e.class}: #{e.message}")
            nil
          end

          # @api private
          #
          # @param error [Exception]
          # @param timings [Turbopuffer::Internal::Transport::RequestObserver::Timings]
          #
          # @return [Symbol]
          def error_kind(error, timings)
            return :canceled unless error.is_a?(StandardError)

            cause = (error.is_a?(Turbopuffer::Errors::APIConnectionError) && error.cause) || error
            # a connect that started but never ended failed
            connecting =
              (!timings.connect_start.nil? && timings.connect_end.nil?) ||
              Turbopuffer::Internal::Transport::RequestObserver::CONNECT_ERRORS.any? { cause.is_a?(_1) }
            case cause
            in ConnectionPool::TimeoutError
              :pool_timeout
            in Timeout::Error | IO::TimeoutError | Errno::ETIMEDOUT if connecting
              :connect_timeout
            in _ if connecting
              :connect_error
            in Net::WriteTimeout
              :write_timeout
            in Net::ReadTimeout
              :read_timeout
            in Timeout::Error | IO::TimeoutError | Errno::ETIMEDOUT | Turbopuffer::Errors::APITimeoutError
              :timeout
            in EOFError | IOError | SystemCallError | OpenSSL::SSL::SSLError
              :read_error
            else
              :other
            end
          end
        end

        # @api private
        #
        # Drives a scope through one logical request for the client.
        class Observation
          class << self
            # @api private
            #
            # @param observer [Turbopuffer::Internal::Transport::RequestObserver]
            # @param request [Hash{Symbol=>Object}]
            # @param started_at [Integer]
            # @param path [String] the interpolated path the request was made with
            #
            # @return [Turbopuffer::Internal::Transport::RequestObserver::Observation, nil]
            def start(observer, request, started_at, path:)
              built_at = Turbopuffer::Internal::Transport::RequestObserver.now
              # the path as given keeps its own query, but not the request's query params
              url = path.match?(%r{\A(/|[a-z][a-z\d+\-.]*://)}i) ? path : "/#{path}"
              info = Turbopuffer::Internal::Transport::RequestObserver::RequestInfo.new(
                method: request.fetch(:method), url: url
              )
              scope = Turbopuffer::Internal::Transport::RequestObserver.call_safely(:start) do
                observer.start(info)
              end
              return nil if scope.nil?

              new(scope, body: !request[:body].nil?, started_at: started_at, built_at: built_at)
            end
          end

          # @api private
          #
          # @param input [Hash{Symbol=>Object}]
          # @param retry_count [Integer]
          #
          # @return [Hash{Symbol=>Object}]
          def attempt_begin(input, retry_count:)
            @attempt += 1
            @retries = retry_count
            unless @attempt.zero?
              @timings = Turbopuffer::Internal::Transport::RequestObserver::Timings.new
              @timings.attempt_start = Turbopuffer::Internal::Transport::RequestObserver.now
            end

            @timings.request_ready = Turbopuffer::Internal::Transport::RequestObserver.now
            @request = {**input.slice(:method, :url, :body), headers: input.fetch(:headers).dup}
            Turbopuffer::Internal::Transport::RequestObserver.call_safely(:attempt_begin) do
              @scope.attempt_begin(@attempt, @request)
            end

            {**input, headers: @request.fetch(:headers), timings: @timings}
          end

          # @api private
          #
          # @param status [Integer, Exception]
          # @param response [Net::HTTPResponse, nil]
          def attempt_end(status, response)
            error = status.is_a?(Exception) ? status : nil
            error_kind = error && Turbopuffer::Internal::Transport::RequestObserver.error_kind(
              error,
              @timings
            )
            reached_server =
              if response
                true
              elsif [:pool_timeout, :connect_timeout, :connect_error].include?(error_kind)
                false
              end

            result = Turbopuffer::Internal::Transport::RequestObserver::AttemptResult.new(
              attempt: @attempt,
              request: @request,
              response: response,
              error: error,
              error_kind: error_kind,
              reached_server: reached_server,
              timings: @timings
            )
            @request = nil
            @response = response
            Turbopuffer::Internal::Transport::RequestObserver.call_safely(:attempt_end) do
              @scope.attempt_end(result)
            end
          end

          # @api private
          def deserialize_start
            @timings.deserialize_start = Turbopuffer::Internal::Transport::RequestObserver.now
          end

          # @api private
          #
          # @param response [Net::HTTPResponse, nil] the response the request ended with, if it
          #   replaced the last attempt's
          # @param parsed [Object, nil]
          # @param error [Exception, nil]
          def finish(response: nil, parsed: nil, error: nil)
            return if @finished
            @finished = true

            # the attempt in flight was interrupted, e.g. by a non-`StandardError`
            attempt_end(error, nil) if @request && error
            unless @timings.deserialize_start.nil?
              @timings.deserialize_end = Turbopuffer::Internal::Transport::RequestObserver.now
            end
            # the body is read lazily while decoding, so deserializing starts once it's read
            body_end = @timings.body_end
            deserialize_start = @timings.deserialize_start
            if body_end && deserialize_start && body_end > deserialize_start
              @timings.deserialize_start = body_end
            end

            error_kind =
              case error
              in nil | Turbopuffer::Errors::APIStatusError
                nil
              else
                Turbopuffer::Internal::Transport::RequestObserver.error_kind(error, @timings)
              end
            result = Turbopuffer::Internal::Transport::RequestObserver::RequestResult.new(
              retries: @retries,
              response: response || @response,
              error: error,
              error_kind: error_kind,
              parsed: parsed,
              timings: @timings
            )
            Turbopuffer::Internal::Transport::RequestObserver.call_safely(:finish) do
              @scope.finish(result)
            end
          end

          # @api private
          #
          # @param scope [Turbopuffer::Internal::Transport::RequestObserver::RequestScope]
          # @param body [Boolean]
          # @param started_at [Integer]
          # @param built_at [Integer]
          def initialize(scope, body:, started_at:, built_at:)
            @scope = scope
            @attempt = -1
            @retries = 0
            @request = nil
            @response = nil
            @finished = false
            @timings = Turbopuffer::Internal::Transport::RequestObserver::Timings.new
            @timings.attempt_start = started_at
            return unless body

            @timings.serialize_start = started_at
            @timings.serialize_end = built_at
          end
        end
      end
    end
  end
end
