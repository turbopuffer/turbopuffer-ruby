# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#write
    class NamespaceWriteResponse < Turbopuffer::Internal::Type::BaseModel
      # @!attribute billing
      #   The billing information for a write request.
      #
      #   @return [Turbopuffer::Models::WriteBilling]
      required :billing, -> { Turbopuffer::WriteBilling }

      # @!attribute message
      #   A message describing the result of the write request.
      #
      #   @return [String]
      required :message, String

      # @!attribute rows_affected
      #   The number of rows affected by the write request.
      #
      #   @return [Integer]
      required :rows_affected, Integer

      # @!attribute status
      #   The status of the request.
      #
      #   @return [Symbol, :OK]
      required :status, const: :OK

      # @!attribute deleted_ids
      #   The IDs of documents that were deleted. Only included when `return_affected_ids`
      #   is true and at least one document was deleted.
      #
      #   @return [Array<String, Integer>, nil]
      optional :deleted_ids, -> { Turbopuffer::Internal::Type::ArrayOf[union: Turbopuffer::ID] }

      # @!attribute patched_ids
      #   The IDs of documents that were patched. Only included when `return_affected_ids`
      #   is true and at least one document was patched.
      #
      #   @return [Array<String, Integer>, nil]
      optional :patched_ids, -> { Turbopuffer::Internal::Type::ArrayOf[union: Turbopuffer::ID] }

      # @!attribute rows_deleted
      #   The number of rows deleted by the write request.
      #
      #   @return [Integer, nil]
      optional :rows_deleted, Integer

      # @!attribute rows_patched
      #   The number of rows patched by the write request.
      #
      #   @return [Integer, nil]
      optional :rows_patched, Integer

      # @!attribute rows_remaining
      #   Whether more documents match the filter for partial operations.
      #
      #   @return [Boolean, nil]
      optional :rows_remaining, Turbopuffer::Internal::Type::Boolean

      # @!attribute rows_upserted
      #   The number of rows upserted by the write request.
      #
      #   @return [Integer, nil]
      optional :rows_upserted, Integer

      # @!attribute upserted_ids
      #   The IDs of documents that were upserted. Only included when
      #   `return_affected_ids` is true and at least one document was upserted.
      #
      #   @return [Array<String, Integer>, nil]
      optional :upserted_ids, -> { Turbopuffer::Internal::Type::ArrayOf[union: Turbopuffer::ID] }

      # @!method initialize(billing:, message:, rows_affected:, deleted_ids: nil, patched_ids: nil, rows_deleted: nil, rows_patched: nil, rows_remaining: nil, rows_upserted: nil, upserted_ids: nil, status: :OK)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::NamespaceWriteResponse} for more details.
      #
      #   The response to a successful write request.
      #
      #   @param billing [Turbopuffer::Models::WriteBilling] The billing information for a write request.
      #
      #   @param message [String] A message describing the result of the write request.
      #
      #   @param rows_affected [Integer] The number of rows affected by the write request.
      #
      #   @param deleted_ids [Array<String, Integer>] The IDs of documents that were deleted. Only included when `return_affected_ids`
      #
      #   @param patched_ids [Array<String, Integer>] The IDs of documents that were patched. Only included when `return_affected_ids`
      #
      #   @param rows_deleted [Integer] The number of rows deleted by the write request.
      #
      #   @param rows_patched [Integer] The number of rows patched by the write request.
      #
      #   @param rows_remaining [Boolean] Whether more documents match the filter for partial operations.
      #
      #   @param rows_upserted [Integer] The number of rows upserted by the write request.
      #
      #   @param upserted_ids [Array<String, Integer>] The IDs of documents that were upserted. Only included when `return_affected_ids
      #
      #   @param status [Symbol, :OK] The status of the request.
    end
  end
end
