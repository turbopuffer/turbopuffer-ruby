# frozen_string_literal: true

module Turbopuffer
  module Models
    # The tokenizer to use for full-text search on an attribute.
    module Tokenizer
      extend Turbopuffer::Internal::Type::Enum

      PRE_TOKENIZED_ARRAY = :pre_tokenized_array
      WORD_V0 = :word_v0
      WORD_V1 = :word_v1

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
