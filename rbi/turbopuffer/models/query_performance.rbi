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

      # Time spent embedding text, in milliseconds. Only set when using a native
      # embedding model.
      sig { returns(T.nilable(Integer)) }
      attr_reader :embedding_ms

      sig { params(embedding_ms: Integer).void }
      attr_writer :embedding_ms

      # The number of tokens embedded. Only set when using a native embedding model.
      sig { returns(T.nilable(Integer)) }
      attr_reader :embedding_tokens

      sig { params(embedding_tokens: Integer).void }
      attr_writer :embedding_tokens

      # The performance information for a query.
      sig do
        params(
          approx_namespace_size: Integer,
          cache_hit_ratio: Float,
          cache_temperature: String,
          exhaustive_search_count: Integer,
          query_execution_ms: Integer,
          server_total_ms: Integer,
          embedding_ms: Integer,
          embedding_tokens: Integer
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
        server_total_ms:,
        # Time spent embedding text, in milliseconds. Only set when using a native
        # embedding model.
        embedding_ms: nil,
        # The number of tokens embedded. Only set when using a native embedding model.
        embedding_tokens: nil
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
            server_total_ms: Integer,
            embedding_ms: Integer,
            embedding_tokens: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
