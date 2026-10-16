# typed: strong

module Turbopuffer
  module Internal
    # Client telemetry reported to turbopuffer on subsequent requests.
    #
    # @api private
    module Telemetry
      ENV_VAR = T.let(T.unsafe(nil), String)
      HEADER = T.let(T.unsafe(nil), String)
      SAMPLE_RATE_HEADER = T.let(T.unsafe(nil), String)

      ENVELOPE_VERSION = T.let(T.unsafe(nil), Integer)

      MAX_RECORDS_PER_HEADER = T.let(T.unsafe(nil), Integer)
      MAX_BUFFERED_RECORDS = T.let(T.unsafe(nil), Integer)

      TRUE_VALUES = T.let(T.unsafe(nil), T::Array[String])
      FALSE_VALUES = T.let(T.unsafe(nil), T::Array[String])

      NAMESPACE_RE = T.let(T.unsafe(nil), Regexp)
      OPERATION_RE = T.let(T.unsafe(nil), Regexp)
      SCHEME_AND_HOST_RE = T.let(T.unsafe(nil), Regexp)

      class << self
        # @api private
        #
        # Resolves whether telemetry is enabled, preferring an explicit value over the environment.
        sig { params(value: T.nilable(T::Boolean)).returns(T::Boolean) }
        def resolve_enabled(value)
        end

        # @api private
        #
        # Returns the method and path of a request with identifiers like the namespace replaced.
        sig do
          params(
            method: T.any(Symbol, String),
            url: T.any(URI::Generic, String)
          ).returns(String)
        end
        def route_template(method, url)
        end

        # @api private
        #
        # Returns the duration in nanoseconds of each client-side phase of an attempt ending at
        # `end_at`. Phases that weren't observed are left out.
        sig do
          params(
            timings: Turbopuffer::Internal::Transport::RequestObserver::Timings,
            end_at: Integer
          ).returns(T::Hash[Symbol, Integer])
        end
        def compute_durations(timings, end_at)
        end

        # @api private
        sig { returns(Float) }
        def random
        end

        # @api private
        #
        # Returns the buffer shared by clients with the same API key and base URL, or nil if
        # telemetry is disabled.
        sig do
          params(
            enabled: T.nilable(T::Boolean),
            api_key: String,
            base_url: String
          ).returns(T.nilable(Turbopuffer::Internal::Telemetry::Buffer))
        end
        def buffer_for(enabled, api_key, base_url)
        end

        # @api private
        sig { void }
        def after_fork_in_child
        end

        sig { void }
        private def install_fork_hook
        end
      end

      # @api private
      #
      # Records taken from a buffer, encoded as a header value.
      class Batch
        sig { returns(T::Array[[Integer, T::Hash[Symbol, T.anything]]]) }
        attr_reader :records

        sig { returns(Integer) }
        attr_reader :dropped

        sig { returns(String) }
        attr_reader :header

        # @api private
        sig do
          params(
            records: T::Array[[Integer, T::Hash[Symbol, T.anything]]],
            dropped: Integer
          ).returns(T.attached_class)
        end
        def self.new(records, dropped)
        end
      end

      # @api private
      #
      # Buffers per-request telemetry records until a later request can carry them.
      class Buffer
        sig { returns(Float) }
        attr_reader :sample_rate

        # @api private
        sig { returns(T.attached_class) }
        def self.new
        end

        # @api private
        #
        # Adopts the sample rate advertised by the server, ignoring invalid values.
        sig { params(response: Net::HTTPResponse).void }
        def observe_response(response)
        end

        # @api private
        #
        # Samples and buffers a record for one request.
        sig do
          params(
            method: T.any(Symbol, String),
            url: T.any(URI::Generic, String),
            status: Integer,
            retries: Integer,
            durations: T::Hash[Symbol, Integer],
            server_total_ms: T.nilable(Numeric),
            error: T.nilable(String),
            reused: T.nilable(T::Boolean)
          ).void
        end
        def record(
          method:,
          url:,
          status:,
          retries:,
          durations:,
          server_total_ms: nil,
          error: nil,
          reused: nil
        )
        end

        # @api private
        #
        # Removes up to `MAX_RECORDS_PER_HEADER` of the oldest records.
        sig { returns(T.nilable(Turbopuffer::Internal::Telemetry::Batch)) }
        def take
        end

        # @api private
        #
        # Returns a batch that never reached the server to the front of the buffer.
        sig { params(batch: Turbopuffer::Internal::Telemetry::Batch).void }
        def restore(batch)
        end

        # @api private
        sig { void }
        def reset_after_fork
        end
      end

      # @api private
      #
      # Installs the request observer that records telemetry for a client.
      class Observer < Turbopuffer::Internal::Transport::RequestObserver
        sig { returns(Turbopuffer::Internal::Telemetry::Buffer) }
        attr_reader :buffer

        # @api private
        sig do
          params(buffer: Turbopuffer::Internal::Telemetry::Buffer).returns(
            T.attached_class
          )
        end
        def self.new(buffer)
        end

        # @api private
        sig do
          params(
            info: Turbopuffer::Internal::Transport::RequestObserver::RequestInfo
          ).returns(Turbopuffer::Internal::Telemetry::Scope)
        end
        def start(info)
        end
      end

      # @api private
      class Scope < Turbopuffer::Internal::Transport::RequestObserver::RequestScope
        # @api private
        sig do
          params(
            buffer: Turbopuffer::Internal::Telemetry::Buffer,
            info: Turbopuffer::Internal::Transport::RequestObserver::RequestInfo
          ).returns(T.attached_class)
        end
        def self.new(buffer, info)
        end

        # @api private
        sig do
          params(attempt: Integer, request: T::Hash[Symbol, T.anything]).void
        end
        def attempt_begin(attempt, request)
        end

        # @api private
        sig do
          params(
            result:
              Turbopuffer::Internal::Transport::RequestObserver::AttemptResult
          ).void
        end
        def attempt_end(result)
        end

        # @api private
        sig do
          params(
            result:
              Turbopuffer::Internal::Transport::RequestObserver::RequestResult
          ).void
        end
        def finish(result)
        end

        sig do
          params(
            result:
              Turbopuffer::Internal::Transport::RequestObserver::RequestResult
          ).returns(Integer)
        end
        private def status(result)
        end

        sig { params(kind: T.nilable(Symbol)).returns(T.nilable(String)) }
        private def error_name(kind)
        end

        sig { params(parsed: T.anything).returns(T.nilable(Numeric)) }
        private def server_total_ms(parsed)
        end

        sig { params(value: T.anything, name: Symbol).returns(T.anything) }
        private def field(value, name)
        end
      end

      # @api private
      #
      # Resets telemetry in forked children.
      module ForkHook
        # @api private
        sig { returns(Integer) }
        def _fork
        end
      end
    end
  end
end
