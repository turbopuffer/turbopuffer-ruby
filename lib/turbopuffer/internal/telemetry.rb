# frozen_string_literal: true

module Turbopuffer
  module Internal
    # Client telemetry reported to turbopuffer on subsequent requests.
    #
    # When enabled, the client buffers a small timing record for each request and
    # attaches buffered records to a later request in the `X-turbopuffer-Client-Telemetry`
    # header. The server controls how many requests are recorded by advertising a
    # sample rate in the `X-turbopuffer-Client-Telemetry-Sample-Rate` response header.
    #
    # @api private
    module Telemetry
      ENV_VAR = "TURBOPUFFER_TELEMETRY"
      HEADER = "x-turbopuffer-client-telemetry"
      SAMPLE_RATE_HEADER = "x-turbopuffer-client-telemetry-sample-rate"

      ENVELOPE_VERSION = 1

      # Keeps the header well under the 8 KB per-line limit of common proxies.
      MAX_RECORDS_PER_HEADER = 20
      MAX_BUFFERED_RECORDS = 1000

      TRUE_VALUES = %w[1 true yes on].freeze
      FALSE_VALUES = ["", "0", "false", "no", "off"].freeze

      NAMESPACE_RE = %r{\A(/v\d+/namespaces/)[^/?]+}
      OPERATION_RE = %r{(/operations/)[^/?]+}
      SCHEME_AND_HOST_RE = %r{\A[a-z][a-z\d+\-.]*://[^/?#]*}i

      class << self
        # @api private
        #
        # Resolves whether telemetry is enabled, preferring an explicit value over the environment.
        #
        # @param value [Boolean, nil]
        #
        # @return [Boolean]
        def resolve_enabled(value)
          return value unless value.nil?

          raw = ENV.fetch(ENV_VAR, "")
          env = raw.strip.downcase
          return true if TRUE_VALUES.include?(env)
          unless FALSE_VALUES.include?(env)
            warn("Turbopuffer: ignoring invalid #{ENV_VAR}=#{raw.inspect}, expected 1 or 0")
          end
          false
        end

        # @api private
        #
        # Returns the method and path of a request with identifiers like the namespace replaced.
        #
        # @param method [Symbol, String]
        # @param url [URI::Generic, String]
        #
        # @return [String]
        def route_template(method, url)
          path = url.to_s.sub(SCHEME_AND_HOST_RE, "")
          path = path.sub(NAMESPACE_RE, '\1{ns}').gsub(OPERATION_RE, '\1{token}')
          "#{method.to_s.upcase} #{path}"
        end

        # @api private
        #
        # Returns the duration in nanoseconds of each client-side phase of an attempt ending at
        # `end_at`. Phases that weren't observed are left out.
        #
        # @param timings [Turbopuffer::Internal::Transport::RequestObserver::Timings]
        # @param end_at [Integer]
        #
        # @return [Hash{Symbol=>Integer}]
        def compute_durations(timings, end_at)
          durations = {}
          return durations if timings.attempt_start.nil?
          durations[:total] = end_at - timings.attempt_start

          if timings.serialize_start && timings.serialize_end
            durations[:serialize] = timings.serialize_end - timings.serialize_start
          end

          # Set by transports that compress request bodies.
          compress_start, compress_end = timings.extra.values_at(:compress_start, :compress_end)
          if compress_start && compress_end
            durations[:compress] = compress_end - compress_start
          end

          # Waiting for a free connection, until connecting a new one or sending on a reused one.
          pool_start = compress_end || timings.request_ready
          connection_ready = timings.connect_start || timings.send_start
          if pool_start && connection_ready
            durations[:pool] = [connection_ready - pool_start, 0].max
          end

          if timings.connect_start && timings.connect_end
            durations[:connect] = timings.connect_end - timings.connect_start
          end

          if timings.send_start && timings.send_end
            durations[:send] = timings.send_end - timings.send_start
          end

          # Covers the network round trip and the server.
          if timings.send_end && timings.response_headers
            durations[:wait] = [timings.response_headers - timings.send_end, 0].max
          end

          if timings.body_end && timings.response_headers
            durations[:body_read] = timings.body_end - timings.response_headers
          end

          if timings.deserialize_start && timings.deserialize_end
            durations[:deserialize] = timings.deserialize_end - timings.deserialize_start
          end

          durations
        end

        # @api private
        #
        # Indirection so tests can control sampling.
        #
        # @return [Float]
        def random = Kernel.rand

        # @api private
        #
        # Returns the buffer shared by clients with the same API key and base URL, or nil if
        # telemetry is disabled. Sharing lets records ride on any client's requests, but never
        # to another org or region.
        #
        # @param enabled [Boolean, nil]
        # @param api_key [String]
        # @param base_url [String]
        #
        # @return [Turbopuffer::Internal::Telemetry::Buffer, nil]
        def buffer_for(enabled, api_key, base_url)
          return nil unless resolve_enabled(enabled)

          key = [api_key, base_url]
          @lock.synchronize do
            holder = @shared[key]
            buffer = holder && @buffers[holder]
            unless buffer
              # Drops the keys of freed buffers.
              @shared.delete_if { !@buffers.key?(_2) }
              buffer = Buffer.new
              holder = Object.new
              @buffers[holder] = buffer
              @shared[key] = holder
              install_fork_hook
            end
            buffer
          end
        end

        # @api private
        def after_fork_in_child
          @lock = Mutex.new
          @buffers.each_value(&:reset_after_fork)
        end

        private

        def install_fork_hook
          return if @fork_hook_installed
          Process.singleton_class.prepend(ForkHook)
          @fork_hook_installed = true
        end
      end

      # @api private
      #
      # Records taken from a buffer, encoded as a header value.
      class Batch
        # @return [Array<Array(Integer, Hash{Symbol=>Object})>]
        attr_reader :records

        # @return [Integer]
        attr_reader :dropped

        # @return [String]
        attr_reader :header

        # @api private
        #
        # @param records [Array<Array(Integer, Hash{Symbol=>Object})>]
        # @param dropped [Integer]
        def initialize(records, dropped)
          @records = records
          @dropped = dropped

          now = Transport::RequestObserver.now
          envelope = {
            version: ENVELOPE_VERSION,
            records: records.map do |recorded_at, rec|
              {**rec, age_ms: ((now - recorded_at) / 1_000_000.0).round}
            end
          }
          envelope[:dropped] = dropped if dropped.positive?
          @header = JSON.generate(envelope)
        end
      end

      # @api private
      #
      # Buffers per-request telemetry records until a later request can carry them.
      class Buffer
        # @return [Float]
        attr_reader :sample_rate

        # @api private
        def initialize
          @lock = Mutex.new
          @records = []
          @dropped = 0
          # Used until the server advertises a rate.
          @sample_rate = 1.0
        end

        # @api private
        #
        # Adopts the sample rate advertised by the server, ignoring invalid values.
        #
        # @param response [Net::HTTPResponse]
        def observe_response(response)
          value = response[SAMPLE_RATE_HEADER]
          return if value.nil?

          rate = Float(value, exception: false)
          @sample_rate = rate if rate&.between?(0.0, 1.0)
        end

        # @api private
        #
        # Samples and buffers a record for one request.
        #
        # @param method [Symbol, String]
        # @param url [URI::Generic, String]
        # @param status [Integer]
        # @param retries [Integer]
        # @param durations [Hash{Symbol=>Integer}] in nanoseconds
        # @param server_total_ms [Numeric, nil]
        # @param error [String, nil]
        # @param reused [Boolean, nil]
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
          rate = @sample_rate
          return if rate <= 0.0 || (rate < 1.0 && Telemetry.random >= rate)

          rec = {route: Telemetry.route_template(method, url), status: status}
          rec[:error] = error unless error.nil?
          rec[:retries] = retries unless retries.zero?
          rec[:sample_rate] = rate if rate < 1.0
          durations.each do |name, duration|
            # A zero compress duration means the body wasn't compressed.
            next if name == :compress && duration.zero?
            rec[:"#{name}_us"] = duration / 1000
          end
          rec[:server_total_us] = (server_total_ms * 1000).round unless server_total_ms.nil?
          rec[:reused] = reused unless reused.nil?

          @lock.synchronize do
            if @records.length >= MAX_BUFFERED_RECORDS
              @records.shift
              @dropped += 1
            end
            @records << [Transport::RequestObserver.now, rec]
          end
        end

        # @api private
        #
        # Removes up to `MAX_RECORDS_PER_HEADER` of the oldest records.
        #
        # @return [Turbopuffer::Internal::Telemetry::Batch, nil]
        def take
          records, dropped = @lock.synchronize do
            return nil if @records.empty?
            taken = @records.shift(MAX_RECORDS_PER_HEADER)
            dropped = @dropped
            @dropped = 0
            [taken, dropped]
          end
          Batch.new(records, dropped)
        end

        # @api private
        #
        # Returns a batch that never reached the server to the front of the buffer.
        #
        # @param batch [Turbopuffer::Internal::Telemetry::Batch]
        def restore(batch)
          @lock.synchronize do
            room = [MAX_BUFFERED_RECORDS - @records.length, 0].max
            # The batch holds the oldest records, so they're the ones to drop when full.
            kept = batch.records.last(room)
            @dropped += batch.dropped + batch.records.length - kept.length
            @records.unshift(*kept)
          end
        end

        # @api private
        def reset_after_fork
          # Another thread may have held the lock at fork time, and buffered records belong to the parent.
          @lock = Mutex.new
          @records = []
          @dropped = 0
        end
      end

      # @api private
      #
      # Installs the request observer that records telemetry for a client.
      class Observer < Transport::RequestObserver
        # @return [Turbopuffer::Internal::Telemetry::Buffer]
        attr_reader :buffer

        # @api private
        #
        # @param buffer [Turbopuffer::Internal::Telemetry::Buffer]
        def initialize(buffer)
          super()
          @buffer = buffer
        end

        # @api private
        #
        # @param info [Turbopuffer::Internal::Transport::RequestObserver::RequestInfo]
        #
        # @return [Turbopuffer::Internal::Telemetry::Scope]
        def start(info) = Scope.new(@buffer, info)
      end

      # @api private
      class Scope < Transport::RequestObserver::RequestScope
        # @api private
        #
        # @param buffer [Turbopuffer::Internal::Telemetry::Buffer]
        # @param info [Turbopuffer::Internal::Transport::RequestObserver::RequestInfo]
        def initialize(buffer, info)
          super()
          @buffer = buffer
          @info = info
          # Kept for later attempts until one of them may have reached the server.
          @batch = nil
        end

        # @api private
        #
        # @param attempt [Integer]
        # @param request [Hash{Symbol=>Object}]
        def attempt_begin(attempt, request)
          # Taken only once a request is about to be sent, so one that fails before then can't lose it.
          @batch = @buffer.take if attempt.zero?
          request.fetch(:headers)[HEADER] = @batch.header if @batch
        end

        # @api private
        #
        # @param result [Turbopuffer::Internal::Transport::RequestObserver::AttemptResult]
        def attempt_end(result)
          @batch = nil unless result.reached_server == false
          @buffer.observe_response(result.response) if result.response
        end

        # @api private
        #
        # @param result [Turbopuffer::Internal::Transport::RequestObserver::RequestResult]
        def finish(result)
          timings = result.timings
          durations = Telemetry.compute_durations(
            timings,
            timings.deserialize_end || Transport::RequestObserver.now
          )

          # A batch that never reached the server goes back for a later request.
          if @batch
            @buffer.restore(@batch)
            @batch = nil
          end

          @buffer.record(
            method: @info.method,
            url: @info.url,
            status: status(result),
            retries: result.retries,
            durations: durations,
            server_total_ms: server_total_ms(result.parsed),
            error: error_name(result.error_kind),
            reused: timings.reused
          )
        end

        private

        # A failed respond-async operation has no response of its own, only the error's status.
        def status(result)
          error = result.error
          return error.status if error.is_a?(Turbopuffer::Errors::APIStatusError) && error.status
          result.response ? result.response.code.to_i : 0
        end

        def error_name(kind)
          if kind.nil?
            nil
          elsif kind == :canceled || kind == :other
            kind.to_s
          elsif kind.end_with?("timeout")
            "timeout"
          else
            "connect"
          end
        end

        def server_total_ms(parsed)
          value = field(field(parsed, :performance), :server_total_ms)
          value if value.is_a?(Numeric) && value.finite?
        end

        def field(value, name)
          case value
          in Turbopuffer::Internal::Type::BaseModel | Hash
            value[name]
          else
            nil
          end
        end
      end

      # @api private
      #
      # Resets telemetry in forked children.
      module ForkHook
        # @api private
        #
        # @return [Integer]
        def _fork
          pid = super
          Telemetry.after_fork_in_child if pid.zero?
          pid
        end
      end

      @lock = Mutex.new
      # Maps API key and base URL to a holder, since weak maps compare keys by identity.
      @shared = {}
      # Maps holders to buffers weakly, so a buffer is freed with the last client using it.
      @buffers = ObjectSpace::WeakMap.new
      @fork_hook_installed = false
    end
  end
end
