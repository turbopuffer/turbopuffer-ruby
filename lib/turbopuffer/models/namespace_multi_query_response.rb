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
      #
      #   @return [Array<Turbopuffer::Models::NamespaceMultiQueryResponse::Result>]
      required :results,
               -> { Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Models::NamespaceMultiQueryResponse::Result] }

      # @!method initialize(billing:, performance:, results:)
      #   The result of a multi-query.
      #
      #   @param billing [Turbopuffer::Models::QueryBilling] The billing information for a query.
      #
      #   @param performance [Turbopuffer::Models::QueryPerformance] The performance information for a query.
      #
      #   @param results [Array<Turbopuffer::Models::NamespaceMultiQueryResponse::Result>]

      class Result < Turbopuffer::Internal::Type::BaseModel
        # @!attribute aggregation_groups
        #
        #   @return [Array<Turbopuffer::Models::Row>, nil]
        optional :aggregation_groups, -> { Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Row] }

        # @!attribute aggregations
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :aggregations, Turbopuffer::Internal::Type::HashOf[Turbopuffer::Internal::Type::Unknown]

        # @!attribute rows
        #
        #   @return [Array<Turbopuffer::Models::Row>, nil]
        optional :rows, -> { Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Row] }

        # @!method initialize(aggregation_groups: nil, aggregations: nil, rows: nil)
        #   @param aggregation_groups [Array<Turbopuffer::Models::Row>]
        #   @param aggregations [Hash{Symbol=>Object}]
        #   @param rows [Array<Turbopuffer::Models::Row>]
      end
    end
  end
end
