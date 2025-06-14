# typed: strong

module Turbopuffer
  module Models
    # The tokenizer to use for full-text search on an attribute.
    module Tokenizer
      extend Turbopuffer::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Turbopuffer::Tokenizer) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PRE_TOKENIZED_ARRAY =
        T.let(:pre_tokenized_array, Turbopuffer::Tokenizer::TaggedSymbol)
      WORD_V0 = T.let(:word_v0, Turbopuffer::Tokenizer::TaggedSymbol)
      WORD_V1 = T.let(:word_v1, Turbopuffer::Tokenizer::TaggedSymbol)

      sig { override.returns(T::Array[Turbopuffer::Tokenizer::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
