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

      # Computes additional values on documents returned by a query. Each key is the
      # name of the computed attribute; each value is an expression describing how to
      # compute it.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :compute_attributes

      sig { params(compute_attributes: T::Hash[Symbol, T.anything]).void }
      attr_writer :compute_attributes

      # The consistency level for a query.
      sig do
        returns(
          T.nilable(
            T.any(
              Turbopuffer::NamespaceQueryParams::Consistency::Strong,
              Turbopuffer::NamespaceQueryParams::Consistency::Eventual
            )
          )
        )
      end
      attr_reader :consistency

      sig do
        params(
          consistency:
            T.any(
              Turbopuffer::NamespaceQueryParams::Consistency::Strong::OrHash,
              Turbopuffer::NamespaceQueryParams::Consistency::Eventual::OrHash
            )
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
      sig { returns(T.nilable(T::Array[T.anything])) }
      attr_reader :group_by

      sig { params(group_by: T::Array[T.anything]).void }
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

      # Limits the documents returned by a query.
      sig { returns(T.nilable(T.any(Integer, Turbopuffer::Limit))) }
      attr_reader :limit

      sig { params(limit: T.any(Integer, Turbopuffer::Limit::OrHash)).void }
      attr_writer :limit

      # Number of documents to skip before returning results. Supported only in v2
      # queries with an explicit `rank_by` and `top_k` or `limit`.
      sig { returns(T.nilable(Integer)) }
      attr_reader :offset

      sig { params(offset: Integer).void }
      attr_writer :offset

      # How to rank the documents in the namespace.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :rank_by

      sig { params(rank_by: T.anything).void }
      attr_writer :rank_by

      # Rerank retrieved candidates with a model.
      sig { returns(T.nilable(Turbopuffer::RerankModelParams)) }
      attr_reader :rerank_by

      sig { params(rerank_by: Turbopuffer::RerankModelParams::OrHash).void }
      attr_writer :rerank_by

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
          compute_attributes: T::Hash[Symbol, T.anything],
          consistency:
            T.any(
              Turbopuffer::NamespaceQueryParams::Consistency::Strong::OrHash,
              Turbopuffer::NamespaceQueryParams::Consistency::Eventual::OrHash
            ),
          distance_metric: Turbopuffer::DistanceMetric::OrSymbol,
          exclude_attributes: T::Array[String],
          filters: T.anything,
          group_by: T::Array[T.anything],
          include_attributes: Turbopuffer::IncludeAttributes::Variants,
          limit: T.any(Integer, Turbopuffer::Limit::OrHash),
          offset: Integer,
          rank_by: T.anything,
          rerank_by: Turbopuffer::RerankModelParams::OrHash,
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
        # Computes additional values on documents returned by a query. Each key is the
        # name of the computed attribute; each value is an expression describing how to
        # compute it.
        compute_attributes: nil,
        # The consistency level for a query.
        consistency: nil,
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
        # Limits the documents returned by a query.
        limit: nil,
        # Number of documents to skip before returning results. Supported only in v2
        # queries with an explicit `rank_by` and `top_k` or `limit`.
        offset: nil,
        # How to rank the documents in the namespace.
        rank_by: nil,
        # Rerank retrieved candidates with a model.
        rerank_by: nil,
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
            compute_attributes: T::Hash[Symbol, T.anything],
            consistency:
              T.any(
                Turbopuffer::NamespaceQueryParams::Consistency::Strong,
                Turbopuffer::NamespaceQueryParams::Consistency::Eventual
              ),
            distance_metric: Turbopuffer::DistanceMetric::OrSymbol,
            exclude_attributes: T::Array[String],
            filters: T.anything,
            group_by: T::Array[T.anything],
            include_attributes: Turbopuffer::IncludeAttributes::Variants,
            limit: T.any(Integer, Turbopuffer::Limit),
            offset: Integer,
            rank_by: T.anything,
            rerank_by: Turbopuffer::RerankModelParams,
            top_k: Integer,
            vector_encoding: Turbopuffer::VectorEncoding::OrSymbol,
            request_options: Turbopuffer::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The consistency level for a query.
      module Consistency
        extend Turbopuffer::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Turbopuffer::NamespaceQueryParams::Consistency::Strong,
              Turbopuffer::NamespaceQueryParams::Consistency::Eventual
            )
          end

        class Strong < Turbopuffer::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Turbopuffer::NamespaceQueryParams::Consistency::Strong,
                Turbopuffer::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :level

          # Strong consistency. Requires a round-trip to object storage to fetch the latest
          # writes.
          sig { params(level: Symbol).returns(T.attached_class) }
          def self.new(level: :strong)
          end

          sig { override.returns({ level: Symbol }) }
          def to_hash
          end
        end

        class Eventual < Turbopuffer::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Turbopuffer::NamespaceQueryParams::Consistency::Eventual,
                Turbopuffer::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :level

          # How long the query may reuse the node's cached view of the namespace before
          # refreshing it from object storage. Defaults to 60.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_staleness_seconds

          sig { params(max_staleness_seconds: Integer).void }
          attr_writer :max_staleness_seconds

          # Eventual consistency. Does not require a round-trip to object storage, but may
          # not see the latest writes.
          sig do
            params(max_staleness_seconds: Integer, level: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # How long the query may reuse the node's cached view of the namespace before
            # refreshing it from object storage. Defaults to 60.
            max_staleness_seconds: nil,
            level: :eventual
          )
          end

          sig do
            override.returns({ level: Symbol, max_staleness_seconds: Integer })
          end
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Turbopuffer::NamespaceQueryParams::Consistency::Variants]
          )
        end
        def self.variants
        end
      end

      # Limits the documents returned by a query.
      module Limit
        extend Turbopuffer::Internal::Type::Union

        Variants = T.type_alias { T.any(Integer, Turbopuffer::Limit) }

        sig do
          override.returns(
            T::Array[Turbopuffer::NamespaceQueryParams::Limit::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
