# frozen_string_literal: true

module Turbopuffer
  module Models
    class OperationError < Turbopuffer::Internal::Type::BaseModel
      # @!attribute detail
      #   The response to an unsuccessful request.
      #
      #   @return [Turbopuffer::Models::OperationError::Detail]
      required :detail, -> { Turbopuffer::OperationError::Detail }

      # @!attribute status_code
      #   The HTTP status code of the operation's error.
      #
      #   @return [Integer]
      required :status_code, Integer

      # @!method initialize(detail:, status_code:)
      #   @param detail [Turbopuffer::Models::OperationError::Detail] The response to an unsuccessful request.
      #
      #   @param status_code [Integer] The HTTP status code of the operation's error.

      # @see Turbopuffer::Models::OperationError#detail
      class Detail < Turbopuffer::Internal::Type::BaseModel
        # @!attribute error
        #   The error message.
        #
        #   @return [String]
        required :error, String

        # @!attribute status
        #   The status of the request.
        #
        #   @return [Symbol, :error]
        required :status, const: :error

        # @!method initialize(error:, status: :error)
        #   The response to an unsuccessful request.
        #
        #   @param error [String] The error message.
        #
        #   @param status [Symbol, :error] The status of the request.
      end
    end
  end
end
