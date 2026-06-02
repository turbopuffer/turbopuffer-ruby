# frozen_string_literal: true

module Turbopuffer
  module Internal
    # Support for transparent polling of async tpuf APIs.
    #
    # Every API request is stamped with `Prefer: respond-async`. If the server
    # applies the preference (i.e. responds with `202 Accepted` +
    # `preference-applied: respond-async`) the SDK polls that URL until the
    # operation finishes and returns the final result as if the API call had
    # been synchronous.
    #
    # @api private
    module RespondAsync
      HEADER_PREFER = "prefer"
      HEADER_PREFERENCE_APPLIED = "preference-applied"
      HEADER_LOCATION = "location"
      RESPOND_ASYNC = "respond-async"

      POLL_INTERVAL = 1.0
      POLL_REQUEST_TIMEOUT = 60.0

      # Timeout tracking for async polling.
      #
      # @api private
      class Timeout
        # @param timeout [Float]
        def initialize(timeout)
          @deadline = Turbopuffer::Internal::Util.monotonic_secs + timeout
        end

        # @return [Float]
        def remaining
          [@deadline - Turbopuffer::Internal::Util.monotonic_secs, 0].max
        end

        # @return [Float]
        def poll_timeout
          [remaining, POLL_REQUEST_TIMEOUT].min
        end

        # @return [Float]
        def sleep_duration
          [remaining, POLL_INTERVAL].min
        end
      end

      class << self
        # @param headers [Hash{String=>String}]
        #
        # @return [void]
        def prepare_headers(headers)
          headers[HEADER_PREFER] ||= RESPOND_ASYNC
        end

        # @param client [Turbopuffer::Internal::Transport::BaseClient]
        # @param request [Hash{Symbol=>Object}] the original built request
        # @param response [Net::HTTPResponse]
        # @param stream [Enumerable<String>]
        #
        # @return [Array(Integer, Net::HTTPResponse, Enumerable<String>)]
        def maybe_poll(client, request, response, stream)
          return [Integer(response.code), response, stream] unless respond_async_applied?(response)

          # Drain the original 202 body so the connection returns to the pool.
          stream&.each { next }

          orig_url = request.fetch(:url)
          location = extract_location(orig_url, response)

          timeout = Timeout.new(request.fetch(:timeout))

          loop do
            result = poll_once(client, orig_url, location, timeout)
            return result if result
          end
        end

        private

        # @param response [Net::HTTPResponse]
        #
        # @return [Boolean]
        def respond_async_applied?(response)
          return false unless response.code == "202"

          applied = response[HEADER_PREFERENCE_APPLIED].to_s
          applied.strip.downcase == RESPOND_ASYNC
        end

        # @param orig_url [URI::Generic]
        # @param response [Net::HTTPResponse]
        #
        # @return [URI::Generic]
        def extract_location(orig_url, response)
          raw_location = response[HEADER_LOCATION].to_s.strip
          if raw_location.empty?
            raise Turbopuffer::Errors::APIError.new(
              url: orig_url,
              message: "Server returned async response without a 'Location' header."
            )
          end

          # Normalize so the default port for the scheme is applied.
          orig = URI(orig_url.to_s)

          # Resolve the Location against the original request URL.
          begin
            location = URI.join(orig, raw_location)
          rescue URI::InvalidURIError
            raise Turbopuffer::Errors::APIError.new(
              url: orig_url,
              message: "malformed 'Location' header: #{raw_location.inspect}"
            )
          end

          if [location.scheme, location.host, location.port] !=
             [orig.scheme, orig.host, orig.port]
            raise Turbopuffer::Errors::APIError.new(
              url: orig_url,
              message: "'Location' origin does not match request origin: #{raw_location.inspect}"
            )
          end

          location
        end

        # @param client [Turbopuffer::Internal::Transport::BaseClient]
        # @param orig_url [URI::Generic]
        # @param location [URI::Generic]
        # @param timeout [Timeout]
        #
        # @return [Array(Integer, Net::HTTPResponse, Array<String>), nil]
        def poll_once(client, orig_url, location, timeout)
          raise Turbopuffer::Errors::APITimeoutError.new(url: orig_url) if timeout.remaining.zero?

          body =
            begin
              client.request(
                method: :get,
                path: location.request_uri,
                model: Turbopuffer::Internal::Type::Unknown,
                options: {
                  extra_headers: {HEADER_PREFER => ""},
                  timeout: timeout.poll_timeout
                }
              )
            rescue JSON::ParserError => e
              raise Turbopuffer::Errors::APIError.new(
                url: orig_url,
                message: "malformed poll response: #{e.message}"
              )
            end

          case body
          in {status: "running"}
            sleep(timeout.sleep_duration)
            nil
          in {status: "finished", result: {success: success}}
            response = Net::HTTPOK.new("1.1", 200, "OK")
            response["content-type"] = "application/json"
            [200, response, [JSON.generate(success)]]
          in {status: "finished", result: {error: {status_code: Integer => err_status, **rest}}}
            raise Turbopuffer::Errors::APIStatusError.for(
              url: orig_url,
              status: err_status,
              headers: nil,
              body: rest[:detail],
              request: nil,
              response: nil
            )
          else
            raise Turbopuffer::Errors::APIError.new(
              url: orig_url,
              message: "malformed poll response: #{body.inspect}"
            )
          end
        end
      end
    end
  end
end
