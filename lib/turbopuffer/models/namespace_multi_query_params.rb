# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#multi_query
    class NamespaceMultiQueryParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      # @!attribute namespace
      #
      #   @return [String]
      required :namespace, String

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

      # @!attribute vector_encoding
      #   The encoding to use for vectors in the response.
      #
      #   @return [Symbol, Turbopuffer::Models::VectorEncoding, nil]
      optional :vector_encoding, enum: -> { Turbopuffer::VectorEncoding }

      # @!method initialize(namespace:, queries:, consistency: nil, vector_encoding: nil, request_options: {})
      #   @param namespace [String]
      #
      #   @param queries [Array<Turbopuffer::Models::NamespaceMultiQueryParams::Query>]
      #
      #   @param consistency [Turbopuffer::Models::NamespaceMultiQueryParams::Consistency] The consistency level for a query.
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

        # @!attribute distance_metric
        #   A function used to calculate vector similarity.
        #
        #   @return [Symbol, Turbopuffer::Models::DistanceMetric, nil]
        optional :distance_metric, enum: -> { Turbopuffer::DistanceMetric }

        # @!attribute filters
        #   Exact filters for attributes to refine search results for. Think of it as a SQL
        #   WHERE clause.
        #
        #   @return [Object, nil]
        optional :filters, Turbopuffer::Internal::Type::Unknown

        # @!attribute include_attributes
        #   Whether to include attributes in the response.
        #
        #   @return [Boolean, Array<String>, nil]
        optional :include_attributes, union: -> { Turbopuffer::IncludeAttributes }

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

        # @!method initialize(aggregate_by: nil, distance_metric: nil, filters: nil, include_attributes: nil, rank_by: nil, top_k: nil)
        #   Some parameter documentations has been truncated, see
        #   {Turbopuffer::Models::NamespaceMultiQueryParams::Query} for more details.
        #
        #   Query, filter, full-text search and vector search documents.
        #
        #   @param aggregate_by [Hash{Symbol=>Object}] Aggregations to compute over all documents in the namespace that match the filte
        #
        #   @param distance_metric [Symbol, Turbopuffer::Models::DistanceMetric] A function used to calculate vector similarity.
        #
        #   @param filters [Object] Exact filters for attributes to refine search results for. Think of it as a SQL
        #
        #   @param include_attributes [Boolean, Array<String>] Whether to include attributes in the response.
        #
        #   @param rank_by [Object] How to rank the documents in the namespace.
        #
        #   @param top_k [Integer] The number of results to return.
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
    end
  end
end
