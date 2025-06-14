# typed: strong

module Turbopuffer
  module Models
    class WriteBilling < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::WriteBilling, Turbopuffer::Internal::AnyHash)
        end

      # The number of billable logical bytes written to the namespace.
      sig { returns(Integer) }
      attr_accessor :billable_logical_bytes_written

      # The billing information for a query.
      sig { returns(T.nilable(Turbopuffer::QueryBilling)) }
      attr_reader :query

      sig { params(query: Turbopuffer::QueryBilling::OrHash).void }
      attr_writer :query

      # The billing information for a write request.
      sig do
        params(
          billable_logical_bytes_written: Integer,
          query: Turbopuffer::QueryBilling::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The number of billable logical bytes written to the namespace.
        billable_logical_bytes_written:,
        # The billing information for a query.
        query: nil
      )
      end

      sig do
        override.returns(
          {
            billable_logical_bytes_written: Integer,
            query: Turbopuffer::QueryBilling
          }
        )
      end
      def to_hash
      end
    end
  end
end
