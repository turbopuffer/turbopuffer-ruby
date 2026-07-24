# frozen_string_literal: true

module Turbopuffer
  module Models
    # How to split a text attribute into fragments for highlighting.
    module HighlightFragmentBy
      extend Turbopuffer::Internal::Type::Enum

      # Treat the whole attribute as a single fragment.
      NONE = :none

      # Split the attribute into sentences. This is the default.
      SENTENCE = :sentence

      # Split the attribute into paragraphs.
      PARAGRAPH = :paragraph

      # Split the attribute into individual words.
      WORD = :word

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
