# typed: strong

module Turbopuffer
  module Models
    class NamespaceWriteResponse < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::Models::NamespaceWriteResponse,
            Turbopuffer::Internal::AnyHash
          )
        end

      # The billing information for a write request.
      sig { returns(Turbopuffer::WriteBilling) }
      attr_reader :billing

      sig { params(billing: Turbopuffer::WriteBilling::OrHash).void }
      attr_writer :billing

      # A message describing the result of the write request.
      sig { returns(String) }
      attr_accessor :message

      # The number of rows affected by the write request.
      sig { returns(Integer) }
      attr_accessor :rows_affected

      # The status of the request.
      sig { returns(Symbol) }
      attr_accessor :status

      # The response to a successful write request.
      sig do
        params(
          billing: Turbopuffer::WriteBilling::OrHash,
          message: String,
          rows_affected: Integer,
          status: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The billing information for a write request.
        billing:,
        # A message describing the result of the write request.
        message:,
        # The number of rows affected by the write request.
        rows_affected:,
        # The status of the request.
        status: :OK
      )
      end

      sig do
        override.returns(
          {
            billing: Turbopuffer::WriteBilling,
            message: String,
            rows_affected: Integer,
            status: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
