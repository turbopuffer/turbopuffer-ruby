# frozen_string_literal: true

module Turbopuffer
  module Models
    class WriteBilling < Turbopuffer::Internal::Type::BaseModel
      # @!attribute billable_logical_bytes_written
      #   The number of billable logical bytes written to the namespace.
      #
      #   @return [Integer]
      required :billable_logical_bytes_written, Integer

      # @!attribute query
      #   The billing information for a query.
      #
      #   @return [Turbopuffer::Models::QueryBilling, nil]
      optional :query, -> { Turbopuffer::QueryBilling }

      # @!method initialize(billable_logical_bytes_written:, query: nil)
      #   The billing information for a write request.
      #
      #   @param billable_logical_bytes_written [Integer] The number of billable logical bytes written to the namespace.
      #
      #   @param query [Turbopuffer::Models::QueryBilling] The billing information for a query.
    end
  end
end
