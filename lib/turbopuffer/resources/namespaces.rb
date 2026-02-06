# frozen_string_literal: true

module Turbopuffer
  module Resources
    class Namespaces
      # Delete namespace.
      #
      # @overload delete_all(namespace: nil, request_options: {})
      #
      # @param namespace [String] The name of the namespace.
      #
      # @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Turbopuffer::Models::NamespaceDeleteAllResponse]
      #
      # @see Turbopuffer::Models::NamespaceDeleteAllParams
      def delete_all(params = {})
        parsed, options = Turbopuffer::NamespaceDeleteAllParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) do
            @client.default_namespace
          end
        @client.request(
          method: :delete,
          path: ["v2/namespaces/%1$s", namespace],
          model: Turbopuffer::Models::NamespaceDeleteAllResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Turbopuffer::Models::NamespaceExplainQueryParams} for more details.
      #
      # Explain a query plan.
      #
      # @overload explain_query(namespace: nil, aggregate_by: nil, consistency: nil, distance_metric: nil, exclude_attributes: nil, filters: nil, group_by: nil, include_attributes: nil, limit: nil, rank_by: nil, top_k: nil, vector_encoding: nil, request_options: {})
      #
      # @param namespace [String] Path param: The name of the namespace.
      #
      # @param aggregate_by [Hash{Symbol=>Object}] Body param: Aggregations to compute over all documents in the namespace that mat
      #
      # @param consistency [Turbopuffer::Models::NamespaceExplainQueryParams::Consistency] Body param: The consistency level for a query.
      #
      # @param distance_metric [Symbol, Turbopuffer::Models::DistanceMetric] Body param: A function used to calculate vector similarity.
      #
      # @param exclude_attributes [Array<String>] Body param: List of attribute names to exclude from the response. All other attr
      #
      # @param filters [Object] Body param: Exact filters for attributes to refine search results for. Think of
      #
      # @param group_by [Array<String>] Body param: Groups documents by the specified attributes (the "group key") befor
      #
      # @param include_attributes [Boolean, Array<String>] Body param: Whether to include attributes in the response.
      #
      # @param limit [Integer, Turbopuffer::Models::NamespaceExplainQueryParams::Limit::Limit] Body param: Limit configuration for query results.
      #
      # @param rank_by [Object] Body param: How to rank the documents in the namespace.
      #
      # @param top_k [Integer] Body param: The number of results to return.
      #
      # @param vector_encoding [Symbol, Turbopuffer::Models::VectorEncoding] Body param: The encoding to use for vectors in the response.
      #
      # @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Turbopuffer::Models::NamespaceExplainQueryResponse]
      #
      # @see Turbopuffer::Models::NamespaceExplainQueryParams
      def explain_query(params = {})
        parsed, options = Turbopuffer::NamespaceExplainQueryParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) do
            @client.default_namespace
          end
        @client.request(
          method: :post,
          path: ["v2/namespaces/%1$s/explain_query", namespace],
          body: parsed,
          model: Turbopuffer::Models::NamespaceExplainQueryResponse,
          options: options
        )
      end

      # Signal turbopuffer to prepare for low-latency requests.
      #
      # @overload hint_cache_warm(namespace: nil, request_options: {})
      #
      # @param namespace [String] The name of the namespace.
      #
      # @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Turbopuffer::Models::NamespaceHintCacheWarmResponse]
      #
      # @see Turbopuffer::Models::NamespaceHintCacheWarmParams
      def hint_cache_warm(params = {})
        parsed, options = Turbopuffer::NamespaceHintCacheWarmParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) do
            @client.default_namespace
          end
        @client.request(
          method: :get,
          path: ["v1/namespaces/%1$s/hint_cache_warm", namespace],
          model: Turbopuffer::Models::NamespaceHintCacheWarmResponse,
          options: options
        )
      end

      # Get metadata about a namespace.
      #
      # @overload metadata(namespace: nil, request_options: {})
      #
      # @param namespace [String] The name of the namespace.
      #
      # @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Turbopuffer::Models::NamespaceMetadata]
      #
      # @see Turbopuffer::Models::NamespaceMetadataParams
      def metadata(params = {})
        parsed, options = Turbopuffer::NamespaceMetadataParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) do
            @client.default_namespace
          end
        @client.request(
          method: :get,
          path: ["v1/namespaces/%1$s/metadata", namespace],
          model: Turbopuffer::NamespaceMetadata,
          options: options
        )
      end

      # Issue multiple concurrent queries filter or search documents.
      #
      # @overload multi_query(queries:, namespace: nil, consistency: nil, vector_encoding: nil, request_options: {})
      #
      # @param queries [Array<Turbopuffer::Models::Query>] Body param
      #
      # @param namespace [String] Path param: The name of the namespace.
      #
      # @param consistency [Turbopuffer::Models::NamespaceMultiQueryParams::Consistency] Body param: The consistency level for a query.
      #
      # @param vector_encoding [Symbol, Turbopuffer::Models::VectorEncoding] Body param: The encoding to use for vectors in the response.
      #
      # @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Turbopuffer::Models::NamespaceMultiQueryResponse]
      #
      # @see Turbopuffer::Models::NamespaceMultiQueryParams
      def multi_query(params)
        parsed, options = Turbopuffer::NamespaceMultiQueryParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) do
            @client.default_namespace
          end
        @client.request(
          method: :post,
          path: ["v2/namespaces/%1$s/query?stainless_overload=multiQuery", namespace],
          body: parsed,
          model: Turbopuffer::Models::NamespaceMultiQueryResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Turbopuffer::Models::NamespaceQueryParams} for more details.
      #
      # Query, filter, full-text search and vector search documents.
      #
      # @overload query(namespace: nil, aggregate_by: nil, consistency: nil, distance_metric: nil, exclude_attributes: nil, filters: nil, group_by: nil, include_attributes: nil, limit: nil, rank_by: nil, top_k: nil, vector_encoding: nil, request_options: {})
      #
      # @param namespace [String] Path param: The name of the namespace.
      #
      # @param aggregate_by [Hash{Symbol=>Object}] Body param: Aggregations to compute over all documents in the namespace that mat
      #
      # @param consistency [Turbopuffer::Models::NamespaceQueryParams::Consistency] Body param: The consistency level for a query.
      #
      # @param distance_metric [Symbol, Turbopuffer::Models::DistanceMetric] Body param: A function used to calculate vector similarity.
      #
      # @param exclude_attributes [Array<String>] Body param: List of attribute names to exclude from the response. All other attr
      #
      # @param filters [Object] Body param: Exact filters for attributes to refine search results for. Think of
      #
      # @param group_by [Array<String>] Body param: Groups documents by the specified attributes (the "group key") befor
      #
      # @param include_attributes [Boolean, Array<String>] Body param: Whether to include attributes in the response.
      #
      # @param limit [Integer, Turbopuffer::Models::NamespaceQueryParams::Limit::Limit] Body param: Limit configuration for query results.
      #
      # @param rank_by [Object] Body param: How to rank the documents in the namespace.
      #
      # @param top_k [Integer] Body param: The number of results to return.
      #
      # @param vector_encoding [Symbol, Turbopuffer::Models::VectorEncoding] Body param: The encoding to use for vectors in the response.
      #
      # @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Turbopuffer::Models::NamespaceQueryResponse]
      #
      # @see Turbopuffer::Models::NamespaceQueryParams
      def query(params = {})
        parsed, options = Turbopuffer::NamespaceQueryParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) do
            @client.default_namespace
          end
        @client.request(
          method: :post,
          path: ["v2/namespaces/%1$s/query", namespace],
          body: parsed,
          model: Turbopuffer::Models::NamespaceQueryResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Turbopuffer::Models::NamespaceRecallParams} for more details.
      #
      # Evaluate recall.
      #
      # @overload recall(namespace: nil, filters: nil, include_ground_truth: nil, num: nil, queries: nil, top_k: nil, request_options: {})
      #
      # @param namespace [String] Path param: The name of the namespace.
      #
      # @param filters [Object] Body param: Filter by attributes. Same syntax as the query endpoint.
      #
      # @param include_ground_truth [Boolean] Body param: Include ground truth data (query vectors and true nearest neighbors)
      #
      # @param num [Integer] Body param: The number of searches to run.
      #
      # @param queries [Array<Float>] Body param: Use specific query vectors for the measurement. If omitted, sampled
      #
      # @param top_k [Integer] Body param: Search for `top_k` nearest neighbors.
      #
      # @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Turbopuffer::Models::NamespaceRecallResponse]
      #
      # @see Turbopuffer::Models::NamespaceRecallParams
      def recall(params = {})
        parsed, options = Turbopuffer::NamespaceRecallParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) do
            @client.default_namespace
          end
        @client.request(
          method: :post,
          path: ["v1/namespaces/%1$s/_debug/recall", namespace],
          body: parsed,
          model: Turbopuffer::Models::NamespaceRecallResponse,
          options: options
        )
      end

      # Get namespace schema.
      #
      # @overload schema(namespace: nil, request_options: {})
      #
      # @param namespace [String] The name of the namespace.
      #
      # @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Hash{Symbol=>Turbopuffer::Models::AttributeSchemaConfig}]
      #
      # @see Turbopuffer::Models::NamespaceSchemaParams
      def schema(params = {})
        parsed, options = Turbopuffer::NamespaceSchemaParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) do
            @client.default_namespace
          end
        @client.request(
          method: :get,
          path: ["v1/namespaces/%1$s/schema", namespace],
          model: Turbopuffer::Internal::Type::HashOf[Turbopuffer::AttributeSchemaConfig],
          options: options
        )
      end

      # Update namespace schema.
      #
      # @overload update_schema(namespace: nil, schema: nil, request_options: {})
      #
      # @param namespace [String] Path param: The name of the namespace.
      #
      # @param schema [Hash{Symbol=>String, Turbopuffer::Models::AttributeSchemaConfig}] Body param: The desired schema for the namespace.
      #
      # @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Hash{Symbol=>Turbopuffer::Models::AttributeSchemaConfig}]
      #
      # @see Turbopuffer::Models::NamespaceUpdateSchemaParams
      def update_schema(params = {})
        parsed, options = Turbopuffer::NamespaceUpdateSchemaParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) do
            @client.default_namespace
          end
        @client.request(
          method: :post,
          path: ["v1/namespaces/%1$s/schema", namespace],
          body: parsed[:schema],
          model: Turbopuffer::Internal::Type::HashOf[Turbopuffer::AttributeSchemaConfig],
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Turbopuffer::Models::NamespaceWriteParams} for more details.
      #
      # Create, update, or delete documents.
      #
      # @overload write(namespace: nil, copy_from_namespace: nil, delete_by_filter: nil, delete_by_filter_allow_partial: nil, delete_condition: nil, deletes: nil, disable_backpressure: nil, distance_metric: nil, encryption: nil, patch_by_filter: nil, patch_by_filter_allow_partial: nil, patch_columns: nil, patch_condition: nil, patch_rows: nil, return_affected_ids: nil, schema: nil, upsert_columns: nil, upsert_condition: nil, upsert_rows: nil, request_options: {})
      #
      # @param namespace [String] Path param: The name of the namespace.
      #
      # @param copy_from_namespace [String, Turbopuffer::Models::NamespaceWriteParams::CopyFromNamespace::CopyFromNamespaceConfig] Body param: The namespace to copy documents from.
      #
      # @param delete_by_filter [Object] Body param: The filter specifying which documents to delete.
      #
      # @param delete_by_filter_allow_partial [Boolean] Body param: Allow partial completion when filter matches too many documents.
      #
      # @param delete_condition [Object] Body param: A condition evaluated against the current value of each document tar
      #
      # @param deletes [Array<String, Integer>] Body param
      #
      # @param disable_backpressure [Boolean] Body param: Disables write throttling (HTTP 429 responses) during high-volume in
      #
      # @param distance_metric [Symbol, Turbopuffer::Models::DistanceMetric] Body param: A function used to calculate vector similarity.
      #
      # @param encryption [Turbopuffer::Models::NamespaceWriteParams::Encryption] Body param: The encryption configuration for a namespace.
      #
      # @param patch_by_filter [Turbopuffer::Models::NamespaceWriteParams::PatchByFilter] Body param: The patch and filter specifying which documents to patch.
      #
      # @param patch_by_filter_allow_partial [Boolean] Body param: Allow partial completion when filter matches too many documents.
      #
      # @param patch_columns [Turbopuffer::Models::Columns] Body param: A list of documents in columnar format. Each key is a column name, m
      #
      # @param patch_condition [Object] Body param: A condition evaluated against the current value of each document tar
      #
      # @param patch_rows [Array<Turbopuffer::Models::Row>] Body param
      #
      # @param return_affected_ids [Boolean] Body param: If true, return the IDs of affected rows (deleted, patched, upserted
      #
      # @param schema [Hash{Symbol=>String, Turbopuffer::Models::AttributeSchemaConfig}] Body param: The schema of the attributes attached to the documents.
      #
      # @param upsert_columns [Turbopuffer::Models::Columns] Body param: A list of documents in columnar format. Each key is a column name, m
      #
      # @param upsert_condition [Object] Body param: A condition evaluated against the current value of each document tar
      #
      # @param upsert_rows [Array<Turbopuffer::Models::Row>] Body param
      #
      # @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Turbopuffer::Models::NamespaceWriteResponse]
      #
      # @see Turbopuffer::Models::NamespaceWriteParams
      def write(params = {})
        parsed, options = Turbopuffer::NamespaceWriteParams.dump_request(params)
        namespace =
          parsed.delete(:namespace) do
            @client.default_namespace
          end
        @client.request(
          method: :post,
          path: ["v2/namespaces/%1$s", namespace],
          body: parsed,
          model: Turbopuffer::Models::NamespaceWriteResponse,
          options: {max_retries: 6, **options}
        )
      end

      # @api private
      #
      # @param client [Turbopuffer::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
