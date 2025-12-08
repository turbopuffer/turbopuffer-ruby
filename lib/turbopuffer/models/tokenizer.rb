# frozen_string_literal: true

module Turbopuffer
  module Models
    # The tokenizer to use for full-text search on an attribute. Defaults to
    # `word_v3`.
    module Tokenizer
      extend Turbopuffer::Internal::Type::Enum

      PRE_TOKENIZED_ARRAY = :pre_tokenized_array
      WORD_V0 = :word_v0
      WORD_V1 = :word_v1
      WORD_V2 = :word_v2
      WORD_V3 = :word_v3

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
