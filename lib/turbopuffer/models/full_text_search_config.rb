# frozen_string_literal: true

module Turbopuffer
  module Models
    class FullTextSearchConfig < Turbopuffer::Internal::Type::BaseModel
      # @!attribute b
      #   The `b` document length normalization parameter for BM25. Defaults to `0.75`.
      #
      #   @return [Float, nil]
      optional :b, Float

      # @!attribute case_sensitive
      #   Whether searching is case-sensitive. Defaults to `false` (i.e.
      #   case-insensitive).
      #
      #   @return [Boolean, nil]
      optional :case_sensitive, Turbopuffer::Internal::Type::Boolean

      # @!attribute k1
      #   The `k1` term saturation parameter for BM25. Defaults to `1.2`.
      #
      #   @return [Float, nil]
      optional :k1, Float

      # @!attribute language
      #   Describes the language of a text attribute. Defaults to `english`.
      #
      #   @return [Symbol, Turbopuffer::Models::Language, nil]
      optional :language, enum: -> { Turbopuffer::Language }

      # @!attribute max_token_length
      #   Maximum length of a token in bytes. Tokens larger than this value during
      #   tokenization will be filtered out. Has to be between `1` and `254` (inclusive).
      #   Defaults to `39`.
      #
      #   @return [Integer, nil]
      optional :max_token_length, Integer

      # @!attribute remove_stopwords
      #   Removes common words from the text based on language. Defaults to `true` (i.e.
      #   remove common words).
      #
      #   @return [Boolean, nil]
      optional :remove_stopwords, Turbopuffer::Internal::Type::Boolean

      # @!attribute stemming
      #   Language-specific stemming for the text. Defaults to `false` (i.e., do not
      #   stem).
      #
      #   @return [Boolean, nil]
      optional :stemming, Turbopuffer::Internal::Type::Boolean

      # @!attribute tokenizer
      #   The tokenizer to use for full-text search on an attribute.
      #
      #   @return [Symbol, Turbopuffer::Models::Tokenizer, nil]
      optional :tokenizer, enum: -> { Turbopuffer::Tokenizer }

      # @!method initialize(b: nil, case_sensitive: nil, k1: nil, language: nil, max_token_length: nil, remove_stopwords: nil, stemming: nil, tokenizer: nil)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::FullTextSearchConfig} for more details.
      #
      #   Configuration options for full-text search.
      #
      #   @param b [Float] The `b` document length normalization parameter for BM25. Defaults to `0.75`.
      #
      #   @param case_sensitive [Boolean] Whether searching is case-sensitive. Defaults to `false` (i.e. case-insensitive)
      #
      #   @param k1 [Float] The `k1` term saturation parameter for BM25. Defaults to `1.2`.
      #
      #   @param language [Symbol, Turbopuffer::Models::Language] Describes the language of a text attribute. Defaults to `english`.
      #
      #   @param max_token_length [Integer] Maximum length of a token in bytes. Tokens larger than this value during tokeniz
      #
      #   @param remove_stopwords [Boolean] Removes common words from the text based on language. Defaults to `true` (i.e. r
      #
      #   @param stemming [Boolean] Language-specific stemming for the text. Defaults to `false` (i.e., do not stem)
      #
      #   @param tokenizer [Symbol, Turbopuffer::Models::Tokenizer] The tokenizer to use for full-text search on an attribute.
    end
  end
end
