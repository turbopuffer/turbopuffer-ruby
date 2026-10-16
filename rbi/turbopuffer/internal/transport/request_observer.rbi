# typed: strong

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
        # @api private
        #
        # Called once per logical request. Returns nil to not observe the request.
        sig do
          params(
            info: Turbopuffer::Internal::Transport::RequestObserver::RequestInfo
          ).returns(
            T.nilable(
              Turbopuffer::Internal::Transport::RequestObserver::RequestScope
            )
          )
        end
        def start(info)
        end

        # @api private
        #
        # Observes a single logical request.
        class RequestScope
          # @api private
          #
          # Called before each attempt is sent. Changes to `request[:headers]` only apply to this attempt.
          sig do
            params(attempt: Integer, request: T::Hash[Symbol, T.anything]).void
          end
          def attempt_begin(attempt, request)
          end

          # @api private
          #
          # Called after each attempt, success or failure.
          sig do
            params(
              result:
                Turbopuffer::Internal::Transport::RequestObserver::AttemptResult
            ).void
          end
          def attempt_end(result)
          end

          # @api private
          #
          # Called at most once, after the response is parsed or when the request fails for good.
          # Streamed responses don't finish.
          sig do
            params(
              result:
                Turbopuffer::Internal::Transport::RequestObserver::RequestResult
            ).void
          end
          def finish(result)
          end
        end

        # @api private
        class RequestInfo
          sig { returns(Symbol) }
          def method
          end

          # The request path, e.g. `/v2/namespaces/a/query`.
          sig { returns(String) }
          def url
          end

          sig { params(method: Symbol, url: String).returns(T.attached_class) }
          def self.new(method:, url:)
          end
        end

        # @api private
        class AttemptResult
          sig { returns(Integer) }
          def attempt
          end

          sig { returns(T::Hash[Symbol, T.anything]) }
          def request
          end

          sig { returns(T.nilable(Net::HTTPResponse)) }
          def response
          end

          sig { returns(T.nilable(Exception)) }
          def error
          end

          sig { returns(T.nilable(Symbol)) }
          def error_kind
          end

          sig { returns(T.nilable(T::Boolean)) }
          def reached_server
          end

          sig do
            returns(Turbopuffer::Internal::Transport::RequestObserver::Timings)
          end
          def timings
          end

          sig do
            params(
              attempt: Integer,
              request: T::Hash[Symbol, T.anything],
              response: T.nilable(Net::HTTPResponse),
              error: T.nilable(Exception),
              error_kind: T.nilable(Symbol),
              reached_server: T.nilable(T::Boolean),
              timings:
                Turbopuffer::Internal::Transport::RequestObserver::Timings
            ).returns(T.attached_class)
          end
          def self.new(
            attempt:,
            request:,
            response:,
            error:,
            error_kind:,
            reached_server:,
            timings:
          )
          end
        end

        # @api private
        class RequestResult
          sig { returns(Integer) }
          def retries
          end

          sig { returns(T.nilable(Net::HTTPResponse)) }
          def response
          end

          sig { returns(T.nilable(Exception)) }
          def error
          end

          sig { returns(T.nilable(Symbol)) }
          def error_kind
          end

          sig { returns(T.anything) }
          def parsed
          end

          sig do
            returns(Turbopuffer::Internal::Transport::RequestObserver::Timings)
          end
          def timings
          end

          sig do
            params(
              retries: Integer,
              response: T.nilable(Net::HTTPResponse),
              error: T.nilable(Exception),
              error_kind: T.nilable(Symbol),
              parsed: T.anything,
              timings:
                Turbopuffer::Internal::Transport::RequestObserver::Timings
            ).returns(T.attached_class)
          end
          def self.new(
            retries:,
            response:,
            error:,
            error_kind:,
            parsed:,
            timings:
          )
          end
        end

        # @api private
        #
        # Monotonic timestamps of one attempt in integer nanoseconds, from `RequestObserver.now`.
        class Timings
          sig { returns(T.nilable(Integer)) }
          attr_accessor :attempt_begin

          sig { returns(T.nilable(Integer)) }
          attr_accessor :serialize_begin

          sig { returns(T.nilable(Integer)) }
          attr_accessor :serialize_end

          sig { returns(T.nilable(Integer)) }
          attr_accessor :request_ready

          sig { returns(T.nilable(Integer)) }
          attr_accessor :connect_begin

          sig { returns(T.nilable(Integer)) }
          attr_accessor :connect_end

          sig { returns(T.nilable(Integer)) }
          attr_accessor :send_begin

          sig { returns(T.nilable(Integer)) }
          attr_accessor :send_end

          sig { returns(T.nilable(Integer)) }
          attr_accessor :response_headers

          sig { returns(T.nilable(Integer)) }
          attr_accessor :body_end

          sig { returns(T.nilable(Integer)) }
          attr_accessor :deserialize_begin

          sig { returns(T.nilable(Integer)) }
          attr_accessor :deserialize_end

          # Whether the attempt used an existing connection, nil when unknown.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :reused

          sig { returns(T::Hash[Symbol, T.anything]) }
          attr_reader :extra

          # @api private
          sig { returns(T.attached_class) }
          def self.new
          end
        end

        # @api private
        CONNECT_ERRORS = T.let(T.unsafe(nil), T::Array[T::Class[Exception]])

        class << self
          # @api private
          sig { returns(Integer) }
          def now
          end

          # @api private
          sig do
            params(hook: Symbol, blk: T.proc.returns(T.anything)).returns(
              T.anything
            )
          end
          def call_safely(hook, &blk)
          end

          # @api private
          sig do
            params(
              error: Exception,
              timings:
                Turbopuffer::Internal::Transport::RequestObserver::Timings
            ).returns(Symbol)
          end
          def error_kind(error, timings)
          end
        end

        # @api private
        #
        # Drives a scope through one logical request for the client.
        class Observation
          # @api private
          sig do
            params(
              observer: Turbopuffer::Internal::Transport::RequestObserver,
              request: T::Hash[Symbol, T.anything],
              started_at: Integer,
              path: String
            ).returns(T.nilable(T.attached_class))
          end
          def self.start(observer, request, started_at, path:)
          end

          # @api private
          sig do
            params(
              input: T::Hash[Symbol, T.anything],
              retry_count: Integer
            ).returns(T::Hash[Symbol, T.anything])
          end
          def attempt_begin(input, retry_count:)
          end

          # @api private
          sig do
            params(
              status: T.any(Integer, Exception),
              response: T.nilable(Net::HTTPResponse)
            ).void
          end
          def attempt_end(status, response)
          end

          # @api private
          sig { void }
          def deserialize_begin
          end

          # @api private
          sig do
            params(
              response: T.nilable(Net::HTTPResponse),
              parsed: T.anything,
              error: T.nilable(Exception)
            ).void
          end
          def finish(response: nil, parsed: nil, error: nil)
          end

          # @api private
          sig do
            params(
              scope:
                Turbopuffer::Internal::Transport::RequestObserver::RequestScope,
              body: T::Boolean,
              started_at: Integer,
              built_at: Integer
            ).returns(T.attached_class)
          end
          def self.new(scope, body:, started_at:, built_at:)
          end
        end
      end
    end
  end
end
