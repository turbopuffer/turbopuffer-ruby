# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#multi_query
    class NamespaceMultiQueryParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      # @!attribute namespace
      #
      #   @return [String, nil]
      optional :namespace, String

      # @!attribute queries
      #
      #   @return [Array<Turbopuffer::Models::NamespaceMultiQueryParams::Query>]
      required :queries,
               -> { Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::NamespaceMultiQueryParams::Query] }

      # @!attribute consistency
      #   The consistency level for a query.
      #
      #   @return [Turbopuffer::Models::NamespaceMultiQueryParams::Consistency, nil]
      optional :consistency, -> { Turbopuffer::NamespaceMultiQueryParams::Consistency }

      # @!attribute limit
      #   Limits the total number of reranked documents returned.
      #
      #   @return [Integer, Turbopuffer::Models::NamespaceMultiQueryParams::Limit::Total, nil]
      optional :limit, union: -> { Turbopuffer::NamespaceMultiQueryParams::Limit }

      # @!attribute offset
      #   Number of reranked documents to skip before returning results. Requires
      #   `rerank_by` and `limit`.
      #
      #   @return [Integer, nil]
      optional :offset, Integer

      # @!attribute rerank_by
      #   How to combine the rows returned by each sub-query into a single ranked list.
      #
      #   @return [Object, nil]
      optional :rerank_by, Turbopuffer::Internal::Type::Unknown

      # @!attribute vector_encoding
      #   The encoding to use for vectors in the response.
      #
      #   @return [Symbol, Turbopuffer::Models::VectorEncoding, nil]
      optional :vector_encoding, enum: -> { Turbopuffer::VectorEncoding }

      # @!method initialize(queries:, namespace: nil, consistency: nil, limit: nil, offset: nil, rerank_by: nil, vector_encoding: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::NamespaceMultiQueryParams} for more details.
      #
      #   @param queries [Array<Turbopuffer::Models::NamespaceMultiQueryParams::Query>]
      #
      #   @param namespace [String]
      #
      #   @param consistency [Turbopuffer::Models::NamespaceMultiQueryParams::Consistency] The consistency level for a query.
      #
      #   @param limit [Integer, Turbopuffer::Models::NamespaceMultiQueryParams::Limit::Total] Limits the total number of reranked documents returned.
      #
      #   @param offset [Integer] Number of reranked documents to skip before returning results. Requires
      #   `rerank\_
      #
      #   @param rerank_by [Object] How to combine the rows returned by each sub-query into a single ranked list.
      #
      #   @param vector_encoding [Symbol, Turbopuffer::Models::VectorEncoding] The encoding to use for vectors in the response.
      #
      #   @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}]

      class Query < Turbopuffer::Internal::Type::BaseModel
        # @!attribute aggregate_by
        #   Aggregations to compute over all documents in the namespace that match the
        #   filters.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :aggregate_by, Turbopuffer::Internal::Type::HashOf[Turbopuffer::Internal::Type::Unknown]

        # @!attribute compute_attributes
        #   Computes additional values on documents returned by a query. Each key is the
        #   name of the computed attribute; each value is an expression describing how to
        #   compute it.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :compute_attributes, Turbopuffer::Internal::Type::HashOf[Turbopuffer::Internal::Type::Unknown]

        # @!attribute distance_metric
        #   A function used to calculate vector similarity.
        #
        #   @return [Symbol, Turbopuffer::Models::DistanceMetric, nil]
        optional :distance_metric, enum: -> { Turbopuffer::DistanceMetric }

        # @!attribute exclude_attributes
        #   List of attribute names to exclude from the response. All other attributes will
        #   be included in the response.
        #
        #   @return [Array<String>, nil]
        optional :exclude_attributes, Turbopuffer::Internal::Type::ArrayOf[String]

        # @!attribute filters
        #   Exact filters for attributes to refine search results for. Think of it as a SQL
        #   WHERE clause.
        #
        #   @return [Object, nil]
        optional :filters, Turbopuffer::Internal::Type::Unknown

        # @!attribute group_by
        #   Groups documents by the specified attributes (the "group key") before computing
        #   aggregates. Aggregates are computed separately for each group.
        #
        #   @return [Array<Object>, nil]
        optional :group_by, Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Internal::Type::Unknown]

        # @!attribute include_attributes
        #   Whether to include attributes in the response.
        #
        #   @return [Boolean, Array<String>, nil]
        optional :include_attributes, union: -> { Turbopuffer::IncludeAttributes }

        # @!attribute limit
        #   Limits the documents returned by a query.
        #
        #   @return [Integer, Turbopuffer::Models::Limit, nil]
        optional :limit, union: -> { Turbopuffer::NamespaceMultiQueryParams::Query::Limit }

        # @!attribute offset
        #   Number of documents to skip before returning results. Supported only in v2
        #   queries with an explicit `rank_by` and `top_k` or `limit`.
        #
        #   @return [Integer, nil]
        optional :offset, Integer

        # @!attribute rank_by
        #   How to rank the documents in the namespace.
        #
        #   @return [Object, nil]
        optional :rank_by, Turbopuffer::Internal::Type::Unknown

        # @!attribute top_k
        #   The number of results to return.
        #
        #   @return [Integer, nil]
        optional :top_k, Integer

        # @!method initialize(aggregate_by: nil, compute_attributes: nil, distance_metric: nil, exclude_attributes: nil, filters: nil, group_by: nil, include_attributes: nil, limit: nil, offset: nil, rank_by: nil, top_k: nil)
        #   Some parameter documentations has been truncated, see
        #   {Turbopuffer::Models::NamespaceMultiQueryParams::Query} for more details.
        #
        #   Query, filter, full-text search and vector search documents.
        #
        #   @param aggregate_by [Hash{Symbol=>Object}] Aggregations to compute over all documents in the namespace that match the filte
        #
        #   @param compute_attributes [Hash{Symbol=>Object}] Computes additional values on documents returned by a query. Each key is the nam
        #
        #   @param distance_metric [Symbol, Turbopuffer::Models::DistanceMetric] A function used to calculate vector similarity.
        #
        #   @param exclude_attributes [Array<String>] List of attribute names to exclude from the response. All other attributes will
        #
        #   @param filters [Object] Exact filters for attributes to refine search results for. Think of it as a SQL
        #
        #   @param group_by [Array<Object>] Groups documents by the specified attributes (the "group key") before computing
        #
        #   @param include_attributes [Boolean, Array<String>] Whether to include attributes in the response.
        #
        #   @param limit [Integer, Turbopuffer::Models::Limit] Limits the documents returned by a query.
        #
        #   @param offset [Integer] Number of documents to skip before returning results. Supported only in v2 queri
        #
        #   @param rank_by [Object] How to rank the documents in the namespace.
        #
        #   @param top_k [Integer] The number of results to return.

        # Limits the documents returned by a query.
        #
        # @see Turbopuffer::Models::NamespaceMultiQueryParams::Query#limit
        module Limit
          extend Turbopuffer::Internal::Type::Union

          variant Integer

          # Limits the documents returned by a query.
          variant -> { Turbopuffer::Limit }

          # @!method self.variants
          #   @return [Array(Integer, Turbopuffer::Models::Limit)]
        end
      end

      class Consistency < Turbopuffer::Internal::Type::BaseModel
        # @!attribute level
        #   The query's consistency level.
        #
        #   @return [Symbol, Turbopuffer::Models::NamespaceMultiQueryParams::Consistency::Level, nil]
        optional :level, enum: -> { Turbopuffer::NamespaceMultiQueryParams::Consistency::Level }

        # @!method initialize(level: nil)
        #   The consistency level for a query.
        #
        #   @param level [Symbol, Turbopuffer::Models::NamespaceMultiQueryParams::Consistency::Level] The query's consistency level.

        # The query's consistency level.
        #
        # @see Turbopuffer::Models::NamespaceMultiQueryParams::Consistency#level
        module Level
          extend Turbopuffer::Internal::Type::Enum

          # Strong consistency. Requires a round-trip to object storage to fetch the latest writes.
          STRONG = :strong

          # Eventual consistency. Does not require a round-trip to object storage, but may not see the latest writes.
          EVENTUAL = :eventual

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Limits the total number of reranked documents returned.
      module Limit
        extend Turbopuffer::Internal::Type::Union

        variant Integer

        variant -> { Turbopuffer::NamespaceMultiQueryParams::Limit::Total }

        class Total < Turbopuffer::Internal::Type::BaseModel
          # @!attribute total
          #
          #   @return [Integer]
          required :total, Integer

          # @!method initialize(total:)
          #   @param total [Integer]
        end

        # @!method self.variants
        #   @return [Array(Integer, Turbopuffer::Models::NamespaceMultiQueryParams::Limit::Total)]
      end
    end
  end
end
