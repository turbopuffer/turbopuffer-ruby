# typed: strong

module Turbopuffer
  module Models
    class NamespaceQueryParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::NamespaceQueryParams,
            Turbopuffer::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :namespace

      sig { params(namespace: String).void }
      attr_writer :namespace

      # Aggregations to compute over all documents in the namespace that match the
      # filters.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :aggregate_by

      sig { params(aggregate_by: T::Hash[Symbol, T.anything]).void }
      attr_writer :aggregate_by

      # The consistency level for a query.
      sig { returns(T.nilable(Turbopuffer::NamespaceQueryParams::Consistency)) }
      attr_reader :consistency

      sig do
        params(
          consistency: Turbopuffer::NamespaceQueryParams::Consistency::OrHash
        ).void
      end
      attr_writer :consistency

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
          aggregate_by: T::Hash[Symbol, T.anything],
          consistency: Turbopuffer::NamespaceQueryParams::Consistency::OrHash,
          distance_metric: Turbopuffer::DistanceMetric::OrSymbol,
          filters: T.anything,
          include_attributes: Turbopuffer::IncludeAttributes::Variants,
          rank_by: T.anything,
          top_k: Integer,
          vector_encoding: Turbopuffer::VectorEncoding::OrSymbol,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        namespace: nil,
        # Aggregations to compute over all documents in the namespace that match the
        # filters.
        aggregate_by: nil,
        # The consistency level for a query.
        consistency: nil,
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
        top_k: nil,
        # The encoding to use for vectors in the response.
        vector_encoding: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            namespace: String,
            aggregate_by: T::Hash[Symbol, T.anything],
            consistency: Turbopuffer::NamespaceQueryParams::Consistency,
            distance_metric: Turbopuffer::DistanceMetric::OrSymbol,
            filters: T.anything,
            include_attributes: Turbopuffer::IncludeAttributes::Variants,
            rank_by: T.anything,
            top_k: Integer,
            vector_encoding: Turbopuffer::VectorEncoding::OrSymbol,
            request_options: Turbopuffer::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Consistency < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::NamespaceQueryParams::Consistency,
              Turbopuffer::Internal::AnyHash
            )
          end

        # The query's consistency level.
        sig do
          returns(
            T.nilable(
              Turbopuffer::NamespaceQueryParams::Consistency::Level::OrSymbol
            )
          )
        end
        attr_reader :level

        sig do
          params(
            level:
              Turbopuffer::NamespaceQueryParams::Consistency::Level::OrSymbol
          ).void
        end
        attr_writer :level

        # The consistency level for a query.
        sig do
          params(
            level:
              Turbopuffer::NamespaceQueryParams::Consistency::Level::OrSymbol
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
                Turbopuffer::NamespaceQueryParams::Consistency::Level::OrSymbol
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
                Turbopuffer::NamespaceQueryParams::Consistency::Level
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Strong consistency. Requires a round-trip to object storage to fetch the latest writes.
          STRONG =
            T.let(
              :strong,
              Turbopuffer::NamespaceQueryParams::Consistency::Level::TaggedSymbol
            )

          # Eventual consistency. Does not require a round-trip to object storage, but may not see the latest writes.
          EVENTUAL =
            T.let(
              :eventual,
              Turbopuffer::NamespaceQueryParams::Consistency::Level::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Turbopuffer::NamespaceQueryParams::Consistency::Level::TaggedSymbol
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
