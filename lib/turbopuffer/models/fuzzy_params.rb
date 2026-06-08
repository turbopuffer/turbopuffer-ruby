# frozen_string_literal: true

module Turbopuffer
  module Models
    class FuzzyParams < Turbopuffer::Internal::Type::BaseModel
      # @!attribute max_edit_distance
      #   Maximum edit distance allowed at each query length. Queries shorter than the
      #   first threshold return no matches.
      #
      #   @return [Array<Turbopuffer::Models::FuzzyMaxEditDistance>]
      required :max_edit_distance,
               -> { Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::FuzzyMaxEditDistance] }

      # @!attribute case_sensitive
      #   Whether searching with Fuzzy filter is case-sensitive. Defaults to `true` (i.e.
      #   case-sensitive).
      #
      #   @return [Boolean, nil]
      optional :case_sensitive, Turbopuffer::Internal::Type::Boolean

      # @!method initialize(max_edit_distance:, case_sensitive: nil)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::FuzzyParams} for more details.
      #
      #   Additional parameters for the Fuzzy filter.
      #
      #   @param max_edit_distance [Array<Turbopuffer::Models::FuzzyMaxEditDistance>] Maximum edit distance allowed at each query length. Queries shorter than the fir
      #
      #   @param case_sensitive [Boolean] Whether searching with Fuzzy filter is case-sensitive. Defaults to `true` (i.e.
    end
  end
end
