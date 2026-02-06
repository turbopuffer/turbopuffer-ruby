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

      # Groups documents by the specified attributes (the "group key") before computing
      # aggregates. Aggregates are computed separately for each group.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :group_by

      sig { params(group_by: T::Array[String]).void }
      attr_writer :group_by

      # Whether to include attributes in the response.
      sig { returns(T.nilable(Turbopuffer::IncludeAttributes::Variants)) }
      attr_reader :include_attributes

      sig do
        params(
          include_attributes: Turbopuffer::IncludeAttributes::Variants
        ).void
      end
      attr_writer :include_attributes

      # Limit configuration for query results.
      sig do
        returns(T.nilable(T.any(Integer, Turbopuffer::Query::Limit::Limit)))
      end
      attr_reader :limit

      sig do
        params(
          limit: T.any(Integer, Turbopuffer::Query::Limit::Limit::OrHash)
        ).void
      end
      attr_writer :limit

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
          group_by: T::Array[String],
          include_attributes: Turbopuffer::IncludeAttributes::Variants,
          limit: T.any(Integer, Turbopuffer::Query::Limit::Limit::OrHash),
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
        # Groups documents by the specified attributes (the "group key") before computing
        # aggregates. Aggregates are computed separately for each group.
        group_by: nil,
        # Whether to include attributes in the response.
        include_attributes: nil,
        # Limit configuration for query results.
        limit: nil,
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
            group_by: T::Array[String],
            include_attributes: Turbopuffer::IncludeAttributes::Variants,
            limit: T.any(Integer, Turbopuffer::Query::Limit::Limit),
            rank_by: T.anything,
            top_k: Integer
          }
        )
      end
      def to_hash
      end

      # Limit configuration for query results.
      module Limit
        extend Turbopuffer::Internal::Type::Union

        Variants =
          T.type_alias { T.any(Integer, Turbopuffer::Query::Limit::Limit) }

        class Limit < Turbopuffer::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Turbopuffer::Query::Limit::Limit,
                Turbopuffer::Internal::AnyHash
              )
            end

          # The total number of results to return.
          sig { returns(Integer) }
          attr_accessor :total

          sig { returns(T.nilable(Turbopuffer::Query::Limit::Limit::Per)) }
          attr_reader :per

          sig do
            params(per: Turbopuffer::Query::Limit::Limit::Per::OrHash).void
          end
          attr_writer :per

          sig do
            params(
              total: Integer,
              per: Turbopuffer::Query::Limit::Limit::Per::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The total number of results to return.
            total:,
            per: nil
          )
          end

          sig do
            override.returns(
              { total: Integer, per: Turbopuffer::Query::Limit::Limit::Per }
            )
          end
          def to_hash
          end

          class Per < Turbopuffer::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Turbopuffer::Query::Limit::Limit::Per,
                  Turbopuffer::Internal::AnyHash
                )
              end

            sig { returns(T::Array[String]) }
            attr_accessor :attributes

            sig { returns(Integer) }
            attr_accessor :limit

            sig do
              params(attributes: T::Array[String], limit: Integer).returns(
                T.attached_class
              )
            end
            def self.new(attributes:, limit:)
            end

            sig do
              override.returns({ attributes: T::Array[String], limit: Integer })
            end
            def to_hash
            end
          end
        end

        sig { override.returns(T::Array[Turbopuffer::Query::Limit::Variants]) }
        def self.variants
        end
      end
    end
  end
end
