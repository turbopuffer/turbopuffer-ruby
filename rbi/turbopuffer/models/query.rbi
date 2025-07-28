# typed: strong

module Turbopuffer
  module Models
    class Query < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::Query, Turbopuffer::Internal::AnyHash)
        end

      # Aggregations to compute over all documents in the namespace that match the
      # filters.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :aggregate_by

      sig { params(aggregate_by: T::Hash[Symbol, T.anything]).void }
      attr_writer :aggregate_by

      # A function used to calculate vector similarity.
      sig { returns(T.nilable(Turbopuffer::DistanceMetric::OrSymbol)) }
      attr_reader :distance_metric

      sig do
        params(distance_metric: Turbopuffer::DistanceMetric::OrSymbol).void
      end
      attr_writer :distance_metric

      # List of attribute names to exclude from the response. All other attributes will
      # be included in the response.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :exclude_attributes

      sig { params(exclude_attributes: T::Array[String]).void }
      attr_writer :exclude_attributes

      # Exact filters for attributes to refine search results for. Think of it as a SQL
      # WHERE clause.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :filters

      sig { params(filters: T.anything).void }
      attr_writer :filters

      # Whether to include attributes in the response.
      sig { returns(T.nilable(Turbopuffer::IncludeAttributes::Variants)) }
      attr_reader :include_attributes

      sig do
        params(
          include_attributes: Turbopuffer::IncludeAttributes::Variants
        ).void
      end
      attr_writer :include_attributes

      # How to rank the documents in the namespace.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :rank_by

      sig { params(rank_by: T.anything).void }
      attr_writer :rank_by

      # The number of results to return.
      sig { returns(T.nilable(Integer)) }
      attr_reader :top_k

      sig { params(top_k: Integer).void }
      attr_writer :top_k

      # Query, filter, full-text search and vector search documents.
      sig do
        params(
          aggregate_by: T::Hash[Symbol, T.anything],
          distance_metric: Turbopuffer::DistanceMetric::OrSymbol,
          exclude_attributes: T::Array[String],
          filters: T.anything,
          include_attributes: Turbopuffer::IncludeAttributes::Variants,
          rank_by: T.anything,
          top_k: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Aggregations to compute over all documents in the namespace that match the
        # filters.
        aggregate_by: nil,
        # A function used to calculate vector similarity.
        distance_metric: nil,
        # List of attribute names to exclude from the response. All other attributes will
        # be included in the response.
        exclude_attributes: nil,
        # Exact filters for attributes to refine search results for. Think of it as a SQL
        # WHERE clause.
        filters: nil,
        # Whether to include attributes in the response.
        include_attributes: nil,
        # How to rank the documents in the namespace.
        rank_by: nil,
        # The number of results to return.
        top_k: nil
      )
      end

      sig do
        override.returns(
          {
            aggregate_by: T::Hash[Symbol, T.anything],
            distance_metric: Turbopuffer::DistanceMetric::OrSymbol,
            exclude_attributes: T::Array[String],
            filters: T.anything,
            include_attributes: Turbopuffer::IncludeAttributes::Variants,
            rank_by: T.anything,
            top_k: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
