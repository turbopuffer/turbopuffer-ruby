# frozen_string_literal: true

module Turbopuffer
  module Models
    class WritePerformance < Turbopuffer::Internal::Type::BaseModel
      # @!attribute server_total_ms
      #   Request time measured on the server, in milliseconds.
      #
      #   @return [Integer]
      required :server_total_ms, Integer

      # @!attribute embedding_ms
      #   Time spent embedding text, in milliseconds. Only set when using a native
      #   embedding model.
      #
      #   @return [Integer, nil]
      optional :embedding_ms, Integer

      # @!attribute embedding_tokens
      #   The number of tokens embedded. Only set when using a native embedding model.
      #
      #   @return [Integer, nil]
      optional :embedding_tokens, Integer

      # @!method initialize(server_total_ms:, embedding_ms: nil, embedding_tokens: nil)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::WritePerformance} for more details.
      #
      #   The performance information for a write request.
      #
      #   @param server_total_ms [Integer] Request time measured on the server, in milliseconds.
      #
      #   @param embedding_ms [Integer] Time spent embedding text, in milliseconds. Only set when using a native embeddi
      #
      #   @param embedding_tokens [Integer] The number of tokens embedded. Only set when using a native embedding model.
    end
  end
end
