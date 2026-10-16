# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#multi_query
    class NamespaceMultiQueryResponse < Turbopuffer::Internal::Type::BaseModel
      # @!attribute billing
      #   The billing information for a query.
      #
      #   @return [Turbopuffer::Models::QueryBilling]
      required :billing, -> { Turbopuffer::QueryBilling }

      # @!attribute performance
      #   The performance information for a query.
      #
      #   @return [Turbopuffer::Models::QueryPerformance]
      required :performance, -> { Turbopuffer::QueryPerformance }

      # @!attribute results
      #   The results of each subquery, in the same order as `queries`. With `rerank_by`,
      #   a single result combining the subqueries' rows.
      #
      #   @return [Array<Turbopuffer::Models::NamespaceMultiQueryResponse::Result>]
      required :results,
               -> { Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Models::NamespaceMultiQueryResponse::Result] }

      # @!method initialize(billing:, performance:, results:)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::NamespaceMultiQueryResponse} for more details.
      #
      #   The result of a multi-query.
      #
      #   @param billing [Turbopuffer::Models::QueryBilling] The billing information for a query.
      #
      #   @param performance [Turbopuffer::Models::QueryPerformance] The performance information for a query.
      #
      #   @param results [Array<Turbopuffer::Models::NamespaceMultiQueryResponse::Result>] The results of each subquery, in the same order as `queries`. With `rerank_by`,

      class Result < Turbopuffer::Internal::Type::BaseModel
        # @!attribute aggregation_groups
        #   One object per aggregation group, with its group key and the value of each
        #   requested aggregation. Only present when `aggregate_by` and `group_by` are both
        #   set.
        #
        #   @return [Array<Hash{Symbol=>Object}>, nil]
        optional :aggregation_groups,
                 Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Internal::Type::HashOf[Turbopuffer::Internal::Type::Unknown]]

        # @!attribute aggregations
        #   The value of each requested aggregation, keyed by its label. Only present when
        #   `aggregate_by` is set without `group_by`.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :aggregations, Turbopuffer::Internal::Type::HashOf[Turbopuffer::Internal::Type::Unknown]

        # @!attribute rows
        #   The documents that matched the query, ordered by `rank_by`. Only present when
        #   `rank_by` is set.
        #
        #   @return [Array<Turbopuffer::Models::Row>, nil]
        optional :rows, -> { Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Row] }

        # @!method initialize(aggregation_groups: nil, aggregations: nil, rows: nil)
        #   Some parameter documentations has been truncated, see
        #   {Turbopuffer::Models::NamespaceMultiQueryResponse::Result} for more details.
        #
        #   The result of a query, or of one subquery of a multi-query.
        #
        #   @param aggregation_groups [Array<Hash{Symbol=>Object}>] One object per aggregation group, with its group key and the value of each reque
        #
        #   @param aggregations [Hash{Symbol=>Object}] The value of each requested aggregation, keyed by its label. Only present when `
        #
        #   @param rows [Array<Turbopuffer::Models::Row>] The documents that matched the query, ordered by `rank_by`. Only present when `r
      end
    end
  end
end
