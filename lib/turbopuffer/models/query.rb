# frozen_string_literal: true

module Turbopuffer
  module Models
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
      #   @return [Array<String>, nil]
      optional :group_by, Turbopuffer::Internal::Type::ArrayOf[String]

      # @!attribute include_attributes
      #   Whether to include attributes in the response.
      #
      #   @return [Boolean, Array<String>, nil]
      optional :include_attributes, union: -> { Turbopuffer::IncludeAttributes }

      # @!attribute limit
      #   Limit configuration for query results.
      #
      #   @return [Integer, Turbopuffer::Models::Query::Limit::Limit, nil]
      optional :limit, union: -> { Turbopuffer::Query::Limit }

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

      # @!method initialize(aggregate_by: nil, distance_metric: nil, exclude_attributes: nil, filters: nil, group_by: nil, include_attributes: nil, limit: nil, rank_by: nil, top_k: nil)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::Query} for more details.
      #
      #   Query, filter, full-text search and vector search documents.
      #
      #   @param aggregate_by [Hash{Symbol=>Object}] Aggregations to compute over all documents in the namespace that match the filte
      #
      #   @param distance_metric [Symbol, Turbopuffer::Models::DistanceMetric] A function used to calculate vector similarity.
      #
      #   @param exclude_attributes [Array<String>] List of attribute names to exclude from the response. All other attributes will
      #
      #   @param filters [Object] Exact filters for attributes to refine search results for. Think of it as a SQL
      #
      #   @param group_by [Array<String>] Groups documents by the specified attributes (the "group key") before computing
      #
      #   @param include_attributes [Boolean, Array<String>] Whether to include attributes in the response.
      #
      #   @param limit [Integer, Turbopuffer::Models::Query::Limit::Limit] Limit configuration for query results.
      #
      #   @param rank_by [Object] How to rank the documents in the namespace.
      #
      #   @param top_k [Integer] The number of results to return.

      # Limit configuration for query results.
      #
      # @see Turbopuffer::Models::Query#limit
      module Limit
        extend Turbopuffer::Internal::Type::Union

        variant Integer

        variant -> { Turbopuffer::Query::Limit::Limit }

        class Limit < Turbopuffer::Internal::Type::BaseModel
          # @!attribute total
          #   The total number of results to return.
          #
          #   @return [Integer]
          required :total, Integer

          # @!attribute per
          #
          #   @return [Turbopuffer::Models::Query::Limit::Limit::Per, nil]
          optional :per, -> { Turbopuffer::Query::Limit::Limit::Per }

          # @!method initialize(total:, per: nil)
          #   @param total [Integer] The total number of results to return.
          #
          #   @param per [Turbopuffer::Models::Query::Limit::Limit::Per]

          # @see Turbopuffer::Models::Query::Limit::Limit#per
          class Per < Turbopuffer::Internal::Type::BaseModel
            # @!attribute attributes
            #
            #   @return [Array<String>]
            required :attributes, Turbopuffer::Internal::Type::ArrayOf[String]

            # @!attribute limit
            #
            #   @return [Integer]
            required :limit, Integer

            # @!method initialize(attributes:, limit:)
            #   @param attributes [Array<String>]
            #   @param limit [Integer]
          end
        end

        # @!method self.variants
        #   @return [Array(Integer, Turbopuffer::Models::Query::Limit::Limit)]
      end
    end
  end
end
