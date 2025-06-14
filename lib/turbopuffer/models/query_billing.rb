# frozen_string_literal: true

module Turbopuffer
  module Models
    class QueryBilling < Turbopuffer::Internal::Type::BaseModel
      # @!attribute billable_logical_bytes_queried
      #   The number of billable logical bytes queried from the namespace.
      #
      #   @return [Integer]
      required :billable_logical_bytes_queried, Integer

      # @!attribute billable_logical_bytes_returned
      #   The number of billable logical bytes returned from the query.
      #
      #   @return [Integer]
      required :billable_logical_bytes_returned, Integer

      # @!method initialize(billable_logical_bytes_queried:, billable_logical_bytes_returned:)
      #   The billing information for a query.
      #
      #   @param billable_logical_bytes_queried [Integer] The number of billable logical bytes queried from the namespace.
      #
      #   @param billable_logical_bytes_returned [Integer] The number of billable logical bytes returned from the query.
    end
  end
end
