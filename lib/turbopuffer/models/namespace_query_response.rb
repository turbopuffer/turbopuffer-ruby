# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#query
    class NamespaceQueryResponse < Turbopuffer::Internal::Type::BaseModel
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

      # @!attribute aggregations
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :aggregations, Turbopuffer::Internal::Type::HashOf[Turbopuffer::Internal::Type::Unknown]

      # @!attribute rows
      #
      #   @return [Array<Turbopuffer::Models::Row>, nil]
      optional :rows, -> { Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Row] }

      # @!method initialize(billing:, performance:, aggregations: nil, rows: nil)
      #   The result of a query.
      #
      #   @param billing [Turbopuffer::Models::QueryBilling] The billing information for a query.
      #
      #   @param performance [Turbopuffer::Models::QueryPerformance] The performance information for a query.
      #
      #   @param aggregations [Hash{Symbol=>Object}]
      #
      #   @param rows [Array<Turbopuffer::Models::Row>]
    end
  end
end
