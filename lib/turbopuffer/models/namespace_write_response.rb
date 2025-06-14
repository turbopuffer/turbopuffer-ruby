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

      # @!method initialize(billing:, message:, rows_affected:, status: :OK)
      #   The response to a successful write request.
      #
      #   @param billing [Turbopuffer::Models::WriteBilling] The billing information for a write request.
      #
      #   @param message [String] A message describing the result of the write request.
      #
      #   @param rows_affected [Integer] The number of rows affected by the write request.
      #
      #   @param status [Symbol, :OK] The status of the request.
    end
  end
end
