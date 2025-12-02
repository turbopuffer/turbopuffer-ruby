# typed: strong

module Turbopuffer
  module Resources
    class Namespaces
      # Delete namespace.
      sig do
        params(
          namespace: String,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(Turbopuffer::Models::NamespaceDeleteAllResponse)
      end
      def delete_all(
        # The name of the namespace.
        namespace: nil,
        request_options: {}
      )
      end

      # Explain a query plan.
      sig do
        params(
          namespace: String,
          aggregate_by: T::Hash[Symbol, T.anything],
          consistency:
            Turbopuffer::NamespaceExplainQueryParams::Consistency::OrHash,
          distance_metric: Turbopuffer::DistanceMetric::OrSymbol,
          exclude_attributes: T::Array[String],
          filters: T.anything,
          group_by: T::Array[String],
          include_attributes: Turbopuffer::IncludeAttributes::Variants,
          rank_by: T.anything,
          top_k: Integer,
          vector_encoding: Turbopuffer::VectorEncoding::OrSymbol,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(Turbopuffer::Models::NamespaceExplainQueryResponse)
      end
      def explain_query(
        # Path param: The name of the namespace.
        namespace: nil,
        # Body param: Aggregations to compute over all documents in the namespace that
        # match the filters.
        aggregate_by: nil,
        # Body param: The consistency level for a query.
        consistency: nil,
        # Body param: A function used to calculate vector similarity.
        distance_metric: nil,
        # Body param: List of attribute names to exclude from the response. All other
        # attributes will be included in the response.
        exclude_attributes: nil,
        # Body param: Exact filters for attributes to refine search results for. Think of
        # it as a SQL WHERE clause.
        filters: nil,
        # Body param: Groups documents by the specified attributes (the "group key")
        # before computing aggregates. Aggregates are computed separately for each group.
        group_by: nil,
        # Body param: Whether to include attributes in the response.
        include_attributes: nil,
        # Body param: How to rank the documents in the namespace.
        rank_by: nil,
        # Body param: The number of results to return.
        top_k: nil,
        # Body param: The encoding to use for vectors in the response.
        vector_encoding: nil,
        request_options: {}
      )
      end

      # Signal turbopuffer to prepare for low-latency requests.
      sig do
        params(
          namespace: String,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(Turbopuffer::Models::NamespaceHintCacheWarmResponse)
      end
      def hint_cache_warm(
        # The name of the namespace.
        namespace: nil,
        request_options: {}
      )
      end

      # Get metadata about a namespace.
      sig do
        params(
          namespace: String,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(Turbopuffer::NamespaceMetadata)
      end
      def metadata(
        # The name of the namespace.
        namespace: nil,
        request_options: {}
      )
      end

      # Issue multiple concurrent queries filter or search documents.
      sig do
        params(
          queries: T::Array[Turbopuffer::Query::OrHash],
          namespace: String,
          consistency:
            Turbopuffer::NamespaceMultiQueryParams::Consistency::OrHash,
          vector_encoding: Turbopuffer::VectorEncoding::OrSymbol,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(Turbopuffer::Models::NamespaceMultiQueryResponse)
      end
      def multi_query(
        # Body param:
        queries:,
        # Path param: The name of the namespace.
        namespace: nil,
        # Body param: The consistency level for a query.
        consistency: nil,
        # Body param: The encoding to use for vectors in the response.
        vector_encoding: nil,
        request_options: {}
      )
      end

      # Query, filter, full-text search and vector search documents.
      sig do
        params(
          namespace: String,
          aggregate_by: T::Hash[Symbol, T.anything],
          consistency: Turbopuffer::NamespaceQueryParams::Consistency::OrHash,
          distance_metric: Turbopuffer::DistanceMetric::OrSymbol,
          exclude_attributes: T::Array[String],
          filters: T.anything,
          group_by: T::Array[String],
          include_attributes: Turbopuffer::IncludeAttributes::Variants,
          rank_by: T.anything,
          top_k: Integer,
          vector_encoding: Turbopuffer::VectorEncoding::OrSymbol,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(Turbopuffer::Models::NamespaceQueryResponse)
      end
      def query(
        # Path param: The name of the namespace.
        namespace: nil,
        # Body param: Aggregations to compute over all documents in the namespace that
        # match the filters.
        aggregate_by: nil,
        # Body param: The consistency level for a query.
        consistency: nil,
        # Body param: A function used to calculate vector similarity.
        distance_metric: nil,
        # Body param: List of attribute names to exclude from the response. All other
        # attributes will be included in the response.
        exclude_attributes: nil,
        # Body param: Exact filters for attributes to refine search results for. Think of
        # it as a SQL WHERE clause.
        filters: nil,
        # Body param: Groups documents by the specified attributes (the "group key")
        # before computing aggregates. Aggregates are computed separately for each group.
        group_by: nil,
        # Body param: Whether to include attributes in the response.
        include_attributes: nil,
        # Body param: How to rank the documents in the namespace.
        rank_by: nil,
        # Body param: The number of results to return.
        top_k: nil,
        # Body param: The encoding to use for vectors in the response.
        vector_encoding: nil,
        request_options: {}
      )
      end

      # Evaluate recall.
      sig do
        params(
          namespace: String,
          filters: T.anything,
          include_ground_truth: T::Boolean,
          num: Integer,
          queries: T::Array[Float],
          top_k: Integer,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(Turbopuffer::Models::NamespaceRecallResponse)
      end
      def recall(
        # Path param: The name of the namespace.
        namespace: nil,
        # Body param: Filter by attributes. Same syntax as the query endpoint.
        filters: nil,
        # Body param: Include ground truth data (query vectors and true nearest neighbors)
        # in the response.
        include_ground_truth: nil,
        # Body param: The number of searches to run.
        num: nil,
        # Body param: Use specific query vectors for the measurement. If omitted, sampled
        # from the index.
        queries: nil,
        # Body param: Search for `top_k` nearest neighbors.
        top_k: nil,
        request_options: {}
      )
      end

      # Get namespace schema.
      sig do
        params(
          namespace: String,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T::Hash[Symbol, Turbopuffer::AttributeSchemaConfig])
      end
      def schema(
        # The name of the namespace.
        namespace: nil,
        request_options: {}
      )
      end

      # Update namespace schema.
      sig do
        params(
          namespace: String,
          schema:
            T::Hash[
              Symbol,
              T.any(String, Turbopuffer::AttributeSchemaConfig::OrHash)
            ],
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T::Hash[Symbol, Turbopuffer::AttributeSchemaConfig])
      end
      def update_schema(
        # Path param: The name of the namespace.
        namespace: nil,
        # Body param: The desired schema for the namespace.
        schema: nil,
        request_options: {}
      )
      end

      # Create, update, or delete documents.
      sig do
        params(
          namespace: String,
          copy_from_namespace:
            T.any(
              String,
              Turbopuffer::NamespaceWriteParams::CopyFromNamespace::CopyFromNamespaceConfig::OrHash
            ),
          delete_by_filter: T.anything,
          delete_by_filter_allow_partial: T::Boolean,
          delete_condition: T.anything,
          deletes: T::Array[Turbopuffer::ID::Variants],
          disable_backpressure: T::Boolean,
          distance_metric: Turbopuffer::DistanceMetric::OrSymbol,
          encryption: Turbopuffer::NamespaceWriteParams::Encryption::OrHash,
          patch_by_filter:
            Turbopuffer::NamespaceWriteParams::PatchByFilter::OrHash,
          patch_by_filter_allow_partial: T::Boolean,
          patch_columns: Turbopuffer::Columns::OrHash,
          patch_condition: T.anything,
          patch_rows: T::Array[Turbopuffer::Row::OrHash],
          schema:
            T::Hash[
              Symbol,
              T.any(String, Turbopuffer::AttributeSchemaConfig::OrHash)
            ],
          upsert_columns: Turbopuffer::Columns::OrHash,
          upsert_condition: T.anything,
          upsert_rows: T::Array[Turbopuffer::Row::OrHash],
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(Turbopuffer::Models::NamespaceWriteResponse)
      end
      def write(
        # Path param: The name of the namespace.
        namespace: nil,
        # Body param: The namespace to copy documents from.
        copy_from_namespace: nil,
        # Body param: The filter specifying which documents to delete.
        delete_by_filter: nil,
        # Body param: Allow partial completion when filter matches too many documents.
        delete_by_filter_allow_partial: nil,
        # Body param: A condition evaluated against the current value of each document
        # targeted by a delete write. Only documents that pass the condition are deleted.
        delete_condition: nil,
        # Body param:
        deletes: nil,
        # Body param: Disables write throttling (HTTP 429 responses) during high-volume
        # ingestion.
        disable_backpressure: nil,
        # Body param: A function used to calculate vector similarity.
        distance_metric: nil,
        # Body param: The encryption configuration for a namespace.
        encryption: nil,
        # Body param: The patch and filter specifying which documents to patch.
        patch_by_filter: nil,
        # Body param: Allow partial completion when filter matches too many documents.
        patch_by_filter_allow_partial: nil,
        # Body param: A list of documents in columnar format. Each key is a column name,
        # mapped to an array of values for that column.
        patch_columns: nil,
        # Body param: A condition evaluated against the current value of each document
        # targeted by a patch write. Only documents that pass the condition are patched.
        patch_condition: nil,
        # Body param:
        patch_rows: nil,
        # Body param: The schema of the attributes attached to the documents.
        schema: nil,
        # Body param: A list of documents in columnar format. Each key is a column name,
        # mapped to an array of values for that column.
        upsert_columns: nil,
        # Body param: A condition evaluated against the current value of each document
        # targeted by an upsert write. Only documents that pass the condition are
        # upserted.
        upsert_condition: nil,
        # Body param:
        upsert_rows: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Turbopuffer::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
