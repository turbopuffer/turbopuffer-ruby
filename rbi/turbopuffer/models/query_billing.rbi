# typed: strong

module Turbopuffer
  module Models
    class QueryBilling < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::QueryBilling, Turbopuffer::Internal::AnyHash)
        end

      # The number of billable logical bytes queried from the namespace.
      sig { returns(Integer) }
      attr_accessor :billable_logical_bytes_queried

      # The number of billable logical bytes returned from the query.
      sig { returns(Integer) }
      attr_accessor :billable_logical_bytes_returned

      # The billing information for a query.
      sig do
        params(
          billable_logical_bytes_queried: Integer,
          billable_logical_bytes_returned: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # The number of billable logical bytes queried from the namespace.
        billable_logical_bytes_queried:,
        # The number of billable logical bytes returned from the query.
        billable_logical_bytes_returned:
      )
      end

      sig do
        override.returns(
          {
            billable_logical_bytes_queried: Integer,
            billable_logical_bytes_returned: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
