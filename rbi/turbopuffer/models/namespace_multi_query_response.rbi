# typed: strong

module Turbopuffer
  module Models
    class NamespaceMultiQueryResponse < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::Models::NamespaceMultiQueryResponse,
            Turbopuffer::Internal::AnyHash
          )
        end

      # The billing information for a query.
      sig { returns(Turbopuffer::QueryBilling) }
      attr_reader :billing

      sig { params(billing: Turbopuffer::QueryBilling::OrHash).void }
      attr_writer :billing

      # The performance information for a query.
      sig { returns(Turbopuffer::QueryPerformance) }
      attr_reader :performance

      sig { params(performance: Turbopuffer::QueryPerformance::OrHash).void }
      attr_writer :performance

      # The results of each subquery, in the same order as `queries`. With `rerank_by`,
      # a single result combining the subqueries' rows.
      sig do
        returns(
          T::Array[Turbopuffer::Models::NamespaceMultiQueryResponse::Result]
        )
      end
      attr_accessor :results

      # The result of a multi-query.
      sig do
        params(
          billing: Turbopuffer::QueryBilling::OrHash,
          performance: Turbopuffer::QueryPerformance::OrHash,
          results:
            T::Array[
              Turbopuffer::Models::NamespaceMultiQueryResponse::Result::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(
        # The billing information for a query.
        billing:,
        # The performance information for a query.
        performance:,
        # The results of each subquery, in the same order as `queries`. With `rerank_by`,
        # a single result combining the subqueries' rows.
        results:
      )
      end

      sig do
        override.returns(
          {
            billing: Turbopuffer::QueryBilling,
            performance: Turbopuffer::QueryPerformance,
            results:
              T::Array[Turbopuffer::Models::NamespaceMultiQueryResponse::Result]
          }
        )
      end
      def to_hash
      end

      class Result < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::Models::NamespaceMultiQueryResponse::Result,
              Turbopuffer::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
        attr_reader :aggregation_groups

        sig do
          params(aggregation_groups: T::Array[T::Hash[Symbol, T.anything]]).void
        end
        attr_writer :aggregation_groups

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :aggregations

        sig { params(aggregations: T::Hash[Symbol, T.anything]).void }
        attr_writer :aggregations

        # The documents that matched the query, ordered by `rank_by`. Only present when
        # `rank_by` is set.
        sig { returns(T.nilable(T::Array[Turbopuffer::Row])) }
        attr_reader :rows

        sig { params(rows: T::Array[Turbopuffer::Row::OrHash]).void }
        attr_writer :rows

        # The result of a query, or of one subquery of a multi-query. With `aggregate_by`,
        # `aggregations` maps each aggregation's label to its value. With `group_by` as
        # well, `aggregation_groups` holds one object per group instead, with its group
        # key and the value of each aggregation.
        sig do
          params(
            aggregation_groups: T::Array[T::Hash[Symbol, T.anything]],
            aggregations: T::Hash[Symbol, T.anything],
            rows: T::Array[Turbopuffer::Row::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          aggregation_groups: nil,
          aggregations: nil,
          # The documents that matched the query, ordered by `rank_by`. Only present when
          # `rank_by` is set.
          rows: nil
        )
        end

        sig do
          override.returns(
            {
              aggregation_groups: T::Array[T::Hash[Symbol, T.anything]],
              aggregations: T::Hash[Symbol, T.anything],
              rows: T::Array[Turbopuffer::Row]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
