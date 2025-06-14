# typed: strong

module Turbopuffer
  module Models
    class NamespaceMultiQueryParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::NamespaceMultiQueryParams,
            Turbopuffer::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :namespace

      sig { returns(T::Array[Turbopuffer::NamespaceMultiQueryParams::Query]) }
      attr_accessor :queries

      # The consistency level for a query.
      sig do
        returns(T.nilable(Turbopuffer::NamespaceMultiQueryParams::Consistency))
      end
      attr_reader :consistency

      sig do
        params(
          consistency:
            Turbopuffer::NamespaceMultiQueryParams::Consistency::OrHash
        ).void
      end
      attr_writer :consistency

      # The encoding to use for vectors in the response.
      sig { returns(T.nilable(Turbopuffer::VectorEncoding::OrSymbol)) }
      attr_reader :vector_encoding

      sig do
        params(vector_encoding: Turbopuffer::VectorEncoding::OrSymbol).void
      end
      attr_writer :vector_encoding

      sig do
        params(
          namespace: String,
          queries:
            T::Array[Turbopuffer::NamespaceMultiQueryParams::Query::OrHash],
          consistency:
            Turbopuffer::NamespaceMultiQueryParams::Consistency::OrHash,
          vector_encoding: Turbopuffer::VectorEncoding::OrSymbol,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        namespace:,
        queries:,
        # The consistency level for a query.
        consistency: nil,
        # The encoding to use for vectors in the response.
        vector_encoding: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            namespace: String,
            queries: T::Array[Turbopuffer::NamespaceMultiQueryParams::Query],
            consistency: Turbopuffer::NamespaceMultiQueryParams::Consistency,
            vector_encoding: Turbopuffer::VectorEncoding::OrSymbol,
            request_options: Turbopuffer::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Query < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::NamespaceMultiQueryParams::Query,
              Turbopuffer::Internal::AnyHash
            )
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

      class Consistency < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::NamespaceMultiQueryParams::Consistency,
              Turbopuffer::Internal::AnyHash
            )
          end

        # The query's consistency level.
        sig do
          returns(
            T.nilable(
              Turbopuffer::NamespaceMultiQueryParams::Consistency::Level::OrSymbol
            )
          )
        end
        attr_reader :level

        sig do
          params(
            level:
              Turbopuffer::NamespaceMultiQueryParams::Consistency::Level::OrSymbol
          ).void
        end
        attr_writer :level

        # The consistency level for a query.
        sig do
          params(
            level:
              Turbopuffer::NamespaceMultiQueryParams::Consistency::Level::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The query's consistency level.
          level: nil
        )
        end

        sig do
          override.returns(
            {
              level:
                Turbopuffer::NamespaceMultiQueryParams::Consistency::Level::OrSymbol
            }
          )
        end
        def to_hash
        end

        # The query's consistency level.
        module Level
          extend Turbopuffer::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Turbopuffer::NamespaceMultiQueryParams::Consistency::Level
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Strong consistency. Requires a round-trip to object storage to fetch the latest writes.
          STRONG =
            T.let(
              :strong,
              Turbopuffer::NamespaceMultiQueryParams::Consistency::Level::TaggedSymbol
            )

          # Eventual consistency. Does not require a round-trip to object storage, but may not see the latest writes.
          EVENTUAL =
            T.let(
              :eventual,
              Turbopuffer::NamespaceMultiQueryParams::Consistency::Level::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Turbopuffer::NamespaceMultiQueryParams::Consistency::Level::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
