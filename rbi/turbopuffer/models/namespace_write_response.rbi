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

      # The IDs of documents that were deleted. Only included when `return_affected_ids`
      # is true and at least one document was deleted.
      sig { returns(T.nilable(T::Array[Turbopuffer::ID::Variants])) }
      attr_reader :deleted_ids

      sig { params(deleted_ids: T::Array[Turbopuffer::ID::Variants]).void }
      attr_writer :deleted_ids

      # The IDs of documents that were patched. Only included when `return_affected_ids`
      # is true and at least one document was patched.
      sig { returns(T.nilable(T::Array[Turbopuffer::ID::Variants])) }
      attr_reader :patched_ids

      sig { params(patched_ids: T::Array[Turbopuffer::ID::Variants]).void }
      attr_writer :patched_ids

      # The number of rows deleted by the write request.
      sig { returns(T.nilable(Integer)) }
      attr_reader :rows_deleted

      sig { params(rows_deleted: Integer).void }
      attr_writer :rows_deleted

      # The number of rows patched by the write request.
      sig { returns(T.nilable(Integer)) }
      attr_reader :rows_patched

      sig { params(rows_patched: Integer).void }
      attr_writer :rows_patched

      # Whether more documents match the filter for partial operations.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :rows_remaining

      sig { params(rows_remaining: T::Boolean).void }
      attr_writer :rows_remaining

      # The number of rows upserted by the write request.
      sig { returns(T.nilable(Integer)) }
      attr_reader :rows_upserted

      sig { params(rows_upserted: Integer).void }
      attr_writer :rows_upserted

      # The IDs of documents that were upserted. Only included when
      # `return_affected_ids` is true and at least one document was upserted.
      sig { returns(T.nilable(T::Array[Turbopuffer::ID::Variants])) }
      attr_reader :upserted_ids

      sig { params(upserted_ids: T::Array[Turbopuffer::ID::Variants]).void }
      attr_writer :upserted_ids

      # The response to a successful write request.
      sig do
        params(
          billing: Turbopuffer::WriteBilling::OrHash,
          message: String,
          rows_affected: Integer,
          deleted_ids: T::Array[Turbopuffer::ID::Variants],
          patched_ids: T::Array[Turbopuffer::ID::Variants],
          rows_deleted: Integer,
          rows_patched: Integer,
          rows_remaining: T::Boolean,
          rows_upserted: Integer,
          upserted_ids: T::Array[Turbopuffer::ID::Variants],
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
        # The IDs of documents that were deleted. Only included when `return_affected_ids`
        # is true and at least one document was deleted.
        deleted_ids: nil,
        # The IDs of documents that were patched. Only included when `return_affected_ids`
        # is true and at least one document was patched.
        patched_ids: nil,
        # The number of rows deleted by the write request.
        rows_deleted: nil,
        # The number of rows patched by the write request.
        rows_patched: nil,
        # Whether more documents match the filter for partial operations.
        rows_remaining: nil,
        # The number of rows upserted by the write request.
        rows_upserted: nil,
        # The IDs of documents that were upserted. Only included when
        # `return_affected_ids` is true and at least one document was upserted.
        upserted_ids: nil,
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
            status: Symbol,
            deleted_ids: T::Array[Turbopuffer::ID::Variants],
            patched_ids: T::Array[Turbopuffer::ID::Variants],
            rows_deleted: Integer,
            rows_patched: Integer,
            rows_remaining: T::Boolean,
            rows_upserted: Integer,
            upserted_ids: T::Array[Turbopuffer::ID::Variants]
          }
        )
      end
      def to_hash
      end
    end
  end
end
