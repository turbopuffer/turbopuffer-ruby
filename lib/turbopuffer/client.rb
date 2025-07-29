# frozen_string_literal: true

module Turbopuffer
  class Client < Turbopuffer::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 4

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.3

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # API key used for authentication
    # @return [String]
    attr_reader :api_key

    # The turbopuffer region to use.
    # @return [String, nil]
    attr_reader :region

    # @return [String, nil]
    attr_reader :default_namespace

    # @return [Turbopuffer::Resources::Namespaces]
    attr_reader :namespaces

    # List namespaces.
    #
    # @overload namespaces(cursor: nil, page_size: nil, prefix: nil, request_options: {})
    #
    # @param cursor [String] Retrieve the next page of results.
    #
    # @param page_size [Integer] Limit the number of results per page.
    #
    # @param prefix [String] Retrieve only the namespaces that match the prefix.
    #
    # @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}, nil]
    #
    # @return [Turbopuffer::Internal::NamespacePage<Turbopuffer::Models::NamespaceSummary>]
    #
    # @see Turbopuffer::Models::ClientNamespacesParams
    def namespaces(params = {})
      parsed, options = Turbopuffer::ClientNamespacesParams.dump_request(params)
      request(
        method: :get,
        path: "v1/namespaces",
        query: parsed,
        page: Turbopuffer::Internal::NamespacePage,
        model: Turbopuffer::NamespaceSummary,
        options: options
      )
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      return {} if @api_key.nil?

      {"authorization" => "Bearer #{@api_key}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] API key used for authentication Defaults to `ENV["TURBOPUFFER_API_KEY"]`
    #
    # @param region [String, nil] The turbopuffer region to use. Defaults to `ENV["TURBOPUFFER_REGION"]`
    #
    # @param default_namespace [String, nil]
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["TURBOPUFFER_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["TURBOPUFFER_API_KEY"],
      region: ENV["TURBOPUFFER_REGION"],
      default_namespace: nil,
      base_url: ENV["TURBOPUFFER_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://#{region}.turbopuffer.com"

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"TURBOPUFFER_API_KEY\"")
      end

      @default_namespace = default_namespace&.to_s
      @api_key = api_key.to_s
      @region = region&.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @namespaces = Turbopuffer::Resources::Namespaces.new(client: self)
    end
  end
end
