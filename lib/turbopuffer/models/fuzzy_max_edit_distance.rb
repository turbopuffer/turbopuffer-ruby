# frozen_string_literal: true

module Turbopuffer
  module Models
    class FuzzyMaxEditDistance < Turbopuffer::Internal::Type::BaseModel
      # @!attribute distance
      #   The maximum edit distance to allow.
      #
      #   @return [Integer]
      required :distance, Integer

      # @!attribute min_query_chars
      #   Minimum number of characters in a query where this distance applies. Must be at
      #   least 3 · (distance + 1).
      #
      #   @return [Integer]
      required :min_query_chars, Integer

      # @!method initialize(distance:, min_query_chars:)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::FuzzyMaxEditDistance} for more details.
      #
      #   An edit distance threshold for the Fuzzy filter.
      #
      #   @param distance [Integer] The maximum edit distance to allow.
      #
      #   @param min_query_chars [Integer] Minimum number of characters in a query where this distance applies. Must be at
    end
  end
end
