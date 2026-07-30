# frozen_string_literal: true

module Turbopuffer
  module Models
    class HighlightConfigParams < Turbopuffer::Internal::Type::BaseModel
      # @!attribute fragment_by
      #   How to split a text attribute into fragments for highlighting.
      #
      #   @return [Symbol, Turbopuffer::Models::HighlightFragmentBy, nil]
      optional :fragment_by, enum: -> { Turbopuffer::HighlightFragmentBy }

      # @!attribute fragment_limit
      #   The maximum number of fragments to return. Defaults to `3`.
      #
      #   @return [Integer, nil]
      optional :fragment_limit, Integer

      # @!attribute include_offsets
      #   The units to report highlighted fragment offsets in.
      #
      #   @return [Symbol, Turbopuffer::Models::HighlightOffsetUnits, nil]
      optional :include_offsets, enum: -> { Turbopuffer::HighlightOffsetUnits }

      # @!attribute rank_fragments_by
      #   How to rank candidate fragments within the attribute before selecting the top
      #   `fragment_limit`. Defaults to the query's `rank_by`.
      #
      #   @return [Object, nil]
      optional :rank_fragments_by, Turbopuffer::Internal::Type::Unknown

      # @!method initialize(fragment_by: nil, fragment_limit: nil, include_offsets: nil, rank_fragments_by: nil)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::HighlightConfigParams} for more details.
      #
      #   Additional (optional) parameters for the Highlight compute expression.
      #
      #   @param fragment_by [Symbol, Turbopuffer::Models::HighlightFragmentBy] How to split a text attribute into fragments for highlighting.
      #
      #   @param fragment_limit [Integer] The maximum number of fragments to return. Defaults to `3`.
      #
      #   @param include_offsets [Symbol, Turbopuffer::Models::HighlightOffsetUnits] The units to report highlighted fragment offsets in.
      #
      #   @param rank_fragments_by [Object] How to rank candidate fragments within the attribute before selecting the top `f
    end
  end
end
