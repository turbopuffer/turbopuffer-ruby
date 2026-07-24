# typed: strong

module Turbopuffer
  module Models
    # How to split a text attribute into fragments for highlighting.
    module HighlightFragmentBy
      extend Turbopuffer::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Turbopuffer::HighlightFragmentBy) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      # Treat the whole attribute as a single fragment.
      NONE = T.let(:none, Turbopuffer::HighlightFragmentBy::TaggedSymbol)

      # Split the attribute into sentences. This is the default.
      SENTENCE =
        T.let(:sentence, Turbopuffer::HighlightFragmentBy::TaggedSymbol)

      # Split the attribute into paragraphs.
      PARAGRAPH =
        T.let(:paragraph, Turbopuffer::HighlightFragmentBy::TaggedSymbol)

      # Split the attribute into individual words.
      WORD = T.let(:word, Turbopuffer::HighlightFragmentBy::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Turbopuffer::HighlightFragmentBy::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
