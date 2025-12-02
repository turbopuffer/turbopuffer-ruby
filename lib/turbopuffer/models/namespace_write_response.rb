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

      # @!method initialize(billing:, message:, rows_affected:, rows_deleted: nil, rows_patched: nil, rows_remaining: nil, rows_upserted: nil, status: :OK)
      #   The response to a successful write request.
      #
      #   @param billing [Turbopuffer::Models::WriteBilling] The billing information for a write request.
      #
      #   @param message [String] A message describing the result of the write request.
      #
      #   @param rows_affected [Integer] The number of rows affected by the write request.
      #
      #   @param rows_deleted [Integer] The number of rows deleted by the write request.
      #
      #   @param rows_patched [Integer] The number of rows patched by the write request.
      #
      #   @param rows_remaining [Boolean] Whether more documents match the filter for partial operations.
      #
      #   @param rows_upserted [Integer] The number of rows upserted by the write request.
      #
      #   @param status [Symbol, :OK] The status of the request.
    end
  end
end
