# typed: strong

module Turbopuffer
  class Client < Turbopuffer::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    # API key used for authentication
    sig { returns(String) }
    attr_reader :api_key

    # The turbopuffer region to use.
    sig { returns(String) }
    attr_reader :region

    sig { returns(T.nilable(String)) }
    attr_reader :default_namespace

    sig { returns(Turbopuffer::Resources::Namespaces) }
    attr_reader :namespaces

    # List namespaces.
    sig do
      params(
        cursor: String,
        page_size: Integer,
        prefix: String,
        request_options: Turbopuffer::RequestOptions::OrHash
      ).returns(
        Turbopuffer::Internal::NamespacePage[Turbopuffer::NamespaceSummary]
      )
    end
    def namespaces(
      # Retrieve the next page of results.
      cursor: nil,
      # Limit the number of results per page.
      page_size: nil,
      # Retrieve only the namespaces that match the prefix.
      prefix: nil,
      request_options: {}
    )
    end

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        region: T.nilable(String),
        default_namespace: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # API key used for authentication Defaults to `ENV["TURBOPUFFER_API_KEY"]`
      api_key: ENV["TURBOPUFFER_API_KEY"],
      # The turbopuffer region to use. Defaults to `ENV["TURBOPUFFER_REGION"]`
      region: ENV["TURBOPUFFER_REGION"],
      default_namespace: nil,
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["TURBOPUFFER_BASE_URL"]`
      base_url: ENV["TURBOPUFFER_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Turbopuffer::Client::DEFAULT_MAX_RETRIES,
      timeout: Turbopuffer::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: Turbopuffer::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Turbopuffer::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
