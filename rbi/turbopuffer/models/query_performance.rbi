# typed: strong

module Turbopuffer
  module Models
    class QueryPerformance < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::QueryPerformance, Turbopuffer::Internal::AnyHash)
        end

      # the approximate number of documents in the namespace.
      sig { returns(Integer) }
      attr_accessor :approx_namespace_size

      # The ratio of cache hits to total cache lookups.
      sig { returns(Float) }
      attr_accessor :cache_hit_ratio

      # A qualitative description of the cache hit ratio (`hot`, `warm`, or `cold`).
      sig { returns(String) }
      attr_accessor :cache_temperature

      # The number of unindexed documents processed by the query.
      sig { returns(Integer) }
      attr_accessor :exhaustive_search_count

      # Request time measured on the server, excluding time spent waiting due to the
      # namespace concurrency limit.
      sig { returns(Integer) }
      attr_accessor :query_execution_ms

      # Request time measured on the server, including time spent waiting for other
      # queries to complete if the namespace was at its concurrency limit.
      sig { returns(Integer) }
      attr_accessor :server_total_ms

      # The performance information for a query.
      sig do
        params(
          approx_namespace_size: Integer,
          cache_hit_ratio: Float,
          cache_temperature: String,
          exhaustive_search_count: Integer,
          query_execution_ms: Integer,
          server_total_ms: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # the approximate number of documents in the namespace.
        approx_namespace_size:,
        # The ratio of cache hits to total cache lookups.
        cache_hit_ratio:,
        # A qualitative description of the cache hit ratio (`hot`, `warm`, or `cold`).
        cache_temperature:,
        # The number of unindexed documents processed by the query.
        exhaustive_search_count:,
        # Request time measured on the server, excluding time spent waiting due to the
        # namespace concurrency limit.
        query_execution_ms:,
        # Request time measured on the server, including time spent waiting for other
        # queries to complete if the namespace was at its concurrency limit.
        server_total_ms:
      )
      end

      sig do
        override.returns(
          {
            approx_namespace_size: Integer,
            cache_hit_ratio: Float,
            cache_temperature: String,
            exhaustive_search_count: Integer,
            query_execution_ms: Integer,
            server_total_ms: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
