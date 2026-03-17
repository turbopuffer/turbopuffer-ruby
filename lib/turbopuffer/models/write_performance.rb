# frozen_string_literal: true

module Turbopuffer
  module Models
    class WritePerformance < Turbopuffer::Internal::Type::BaseModel
      # @!attribute server_total_ms
      #   Request time measured on the server, in milliseconds.
      #
      #   @return [Integer]
      required :server_total_ms, Integer

      # @!method initialize(server_total_ms:)
      #   The performance information for a write request.
      #
      #   @param server_total_ms [Integer] Request time measured on the server, in milliseconds.
    end
  end
end
