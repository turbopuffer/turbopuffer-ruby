# frozen_string_literal: true

module Turbopuffer
  module Models
    class QueryPerformance < Turbopuffer::Internal::Type::BaseModel
      # @!attribute approx_namespace_size
      #   the approximate number of documents in the namespace.
      #
      #   @return [Integer]
      required :approx_namespace_size, Integer

      # @!attribute cache_hit_ratio
      #   The ratio of cache hits to total cache lookups.
      #
      #   @return [Float]
      required :cache_hit_ratio, Float

      # @!attribute cache_temperature
      #   A qualitative description of the cache hit ratio (`hot`, `warm`, or `cold`).
      #
      #   @return [String]
      required :cache_temperature, String

      # @!attribute exhaustive_search_count
      #   The number of unindexed documents processed by the query.
      #
      #   @return [Integer]
      required :exhaustive_search_count, Integer

      # @!attribute query_execution_ms
      #   Request time measured on the server, excluding time spent waiting due to the
      #   namespace concurrency limit.
      #
      #   @return [Integer]
      required :query_execution_ms, Integer

      # @!attribute server_total_ms
      #   Request time measured on the server, including time spent waiting for other
      #   queries to complete if the namespace was at its concurrency limit.
      #
      #   @return [Integer]
      required :server_total_ms, Integer

      # @!attribute embedding_ms
      #   Time spent embedding text, in milliseconds. Only set when using a native
      #   embedding model.
      #
      #   @return [Integer, nil]
      optional :embedding_ms, Integer

      # @!attribute embedding_tokens
      #   The number of tokens embedded. Only set when using a native embedding model.
      #
      #   @return [Integer, nil]
      optional :embedding_tokens, Integer

      # @!method initialize(approx_namespace_size:, cache_hit_ratio:, cache_temperature:, exhaustive_search_count:, query_execution_ms:, server_total_ms:, embedding_ms: nil, embedding_tokens: nil)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::QueryPerformance} for more details.
      #
      #   The performance information for a query.
      #
      #   @param approx_namespace_size [Integer] the approximate number of documents in the namespace.
      #
      #   @param cache_hit_ratio [Float] The ratio of cache hits to total cache lookups.
      #
      #   @param cache_temperature [String] A qualitative description of the cache hit ratio (`hot`, `warm`, or `cold`).
      #
      #   @param exhaustive_search_count [Integer] The number of unindexed documents processed by the query.
      #
      #   @param query_execution_ms [Integer] Request time measured on the server, excluding time spent waiting due to the nam
      #
      #   @param server_total_ms [Integer] Request time measured on the server, including time spent waiting for other quer
      #
      #   @param embedding_ms [Integer] Time spent embedding text, in milliseconds. Only set when using a native embeddi
      #
      #   @param embedding_tokens [Integer] The number of tokens embedded. Only set when using a native embedding model.
    end
  end
end
