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
      #   {Turbopuffer::Models::Query} for more details.
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
  end
end
