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

      sig { returns(T.nilable(String)) }
      attr_reader :namespace

      sig { params(namespace: String).void }
      attr_writer :namespace

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

      # Limits the total number of reranked documents returned.
      sig do
        returns(
          T.nilable(
            T.any(Integer, Turbopuffer::NamespaceMultiQueryParams::Limit::Total)
          )
        )
      end
      attr_reader :limit

      sig do
        params(
          limit:
            T.any(
              Integer,
              Turbopuffer::NamespaceMultiQueryParams::Limit::Total::OrHash
            )
        ).void
      end
      attr_writer :limit

      # Number of reranked documents to skip before returning results. Requires
      # `rerank_by` and `limit`.
      sig { returns(T.nilable(Integer)) }
      attr_reader :offset

      sig { params(offset: Integer).void }
      attr_writer :offset

      # How to combine the rows returned by each sub-query into a single ranked list.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :rerank_by

      sig { params(rerank_by: T.anything).void }
      attr_writer :rerank_by

      # The encoding to use for vectors in the response.
      sig { returns(T.nilable(Turbopuffer::VectorEncoding::OrSymbol)) }
      attr_reader :vector_encoding

      sig do
        params(vector_encoding: Turbopuffer::VectorEncoding::OrSymbol).void
      end
      attr_writer :vector_encoding

      sig do
        params(
          queries:
            T::Array[Turbopuffer::NamespaceMultiQueryParams::Query::OrHash],
          namespace: String,
          consistency:
            Turbopuffer::NamespaceMultiQueryParams::Consistency::OrHash,
          limit:
            T.any(
              Integer,
              Turbopuffer::NamespaceMultiQueryParams::Limit::Total::OrHash
            ),
          offset: Integer,
          rerank_by: T.anything,
          vector_encoding: Turbopuffer::VectorEncoding::OrSymbol,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        queries:,
        namespace: nil,
        # The consistency level for a query.
        consistency: nil,
        # Limits the total number of reranked documents returned.
        limit: nil,
        # Number of reranked documents to skip before returning results. Requires
        # `rerank_by` and `limit`.
        offset: nil,
        # How to combine the rows returned by each sub-query into a single ranked list.
        rerank_by: nil,
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
            limit:
              T.any(
                Integer,
                Turbopuffer::NamespaceMultiQueryParams::Limit::Total
              ),
            offset: Integer,
            rerank_by: T.anything,
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

        # Computes additional values on documents returned by a query. Each key is the
        # name of the computed attribute; each value is an expression describing how to
        # compute it.
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :compute_attributes

        sig { params(compute_attributes: T::Hash[Symbol, T.anything]).void }
        attr_writer :compute_attributes

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

        # The number of results to return.
        sig { returns(T.nilable(Integer)) }
        attr_reader :top_k

        sig { params(top_k: Integer).void }
        attr_writer :top_k

        # Query, filter, full-text search and vector search documents.
        sig do
          params(
            aggregate_by: T::Hash[Symbol, T.anything],
            compute_attributes: T::Hash[Symbol, T.anything],
            distance_metric: Turbopuffer::DistanceMetric::OrSymbol,
            exclude_attributes: T::Array[String],
            filters: T.anything,
            group_by: T::Array[T.anything],
            include_attributes: Turbopuffer::IncludeAttributes::Variants,
            limit: T.any(Integer, Turbopuffer::Limit::OrHash),
            offset: Integer,
            rank_by: T.anything,
            top_k: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Aggregations to compute over all documents in the namespace that match the
          # filters.
          aggregate_by: nil,
          # Computes additional values on documents returned by a query. Each key is the
          # name of the computed attribute; each value is an expression describing how to
          # compute it.
          compute_attributes: nil,
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
          # The number of results to return.
          top_k: nil
        )
        end

        sig do
          override.returns(
            {
              aggregate_by: T::Hash[Symbol, T.anything],
              compute_attributes: T::Hash[Symbol, T.anything],
              distance_metric: Turbopuffer::DistanceMetric::OrSymbol,
              exclude_attributes: T::Array[String],
              filters: T.anything,
              group_by: T::Array[T.anything],
              include_attributes: Turbopuffer::IncludeAttributes::Variants,
              limit: T.any(Integer, Turbopuffer::Limit),
              offset: Integer,
              rank_by: T.anything,
              top_k: Integer
            }
          )
        end
        def to_hash
        end

        # Limits the documents returned by a query.
        module Limit
          extend Turbopuffer::Internal::Type::Union

          Variants = T.type_alias { T.any(Integer, Turbopuffer::Limit) }

          sig do
            override.returns(
              T::Array[
                Turbopuffer::NamespaceMultiQueryParams::Query::Limit::Variants
              ]
            )
          end
          def self.variants
          end
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

      # Limits the total number of reranked documents returned.
      module Limit
        extend Turbopuffer::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(Integer, Turbopuffer::NamespaceMultiQueryParams::Limit::Total)
          end

        class Total < Turbopuffer::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Turbopuffer::NamespaceMultiQueryParams::Limit::Total,
                Turbopuffer::Internal::AnyHash
              )
            end

          sig { returns(Integer) }
          attr_accessor :total

          sig { params(total: Integer).returns(T.attached_class) }
          def self.new(total:)
          end

          sig { override.returns({ total: Integer }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Turbopuffer::NamespaceMultiQueryParams::Limit::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
