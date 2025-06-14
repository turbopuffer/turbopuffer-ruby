# typed: strong

module Turbopuffer
  module Models
    class FullTextSearchConfig < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::FullTextSearchConfig,
            Turbopuffer::Internal::AnyHash
          )
        end

      # The `b` document length normalization parameter for BM25. Defaults to `0.75`.
      sig { returns(T.nilable(Float)) }
      attr_reader :b

      sig { params(b: Float).void }
      attr_writer :b

      # Whether searching is case-sensitive. Defaults to `false` (i.e.
      # case-insensitive).
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :case_sensitive

      sig { params(case_sensitive: T::Boolean).void }
      attr_writer :case_sensitive

      # The `k1` term saturation parameter for BM25. Defaults to `1.2`.
      sig { returns(T.nilable(Float)) }
      attr_reader :k1

      sig { params(k1: Float).void }
      attr_writer :k1

      # Describes the language of a text attribute. Defaults to `english`.
      sig { returns(T.nilable(Turbopuffer::Language::OrSymbol)) }
      attr_reader :language

      sig { params(language: Turbopuffer::Language::OrSymbol).void }
      attr_writer :language

      # Removes common words from the text based on language. Defaults to `true` (i.e.
      # remove common words).
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :remove_stopwords

      sig { params(remove_stopwords: T::Boolean).void }
      attr_writer :remove_stopwords

      # Language-specific stemming for the text. Defaults to `false` (i.e., do not
      # stem).
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stemming

      sig { params(stemming: T::Boolean).void }
      attr_writer :stemming

      # The tokenizer to use for full-text search on an attribute.
      sig { returns(T.nilable(Turbopuffer::Tokenizer::OrSymbol)) }
      attr_reader :tokenizer

      sig { params(tokenizer: Turbopuffer::Tokenizer::OrSymbol).void }
      attr_writer :tokenizer

      # Configuration options for full-text search.
      sig do
        params(
          b: Float,
          case_sensitive: T::Boolean,
          k1: Float,
          language: Turbopuffer::Language::OrSymbol,
          remove_stopwords: T::Boolean,
          stemming: T::Boolean,
          tokenizer: Turbopuffer::Tokenizer::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The `b` document length normalization parameter for BM25. Defaults to `0.75`.
        b: nil,
        # Whether searching is case-sensitive. Defaults to `false` (i.e.
        # case-insensitive).
        case_sensitive: nil,
        # The `k1` term saturation parameter for BM25. Defaults to `1.2`.
        k1: nil,
        # Describes the language of a text attribute. Defaults to `english`.
        language: nil,
        # Removes common words from the text based on language. Defaults to `true` (i.e.
        # remove common words).
        remove_stopwords: nil,
        # Language-specific stemming for the text. Defaults to `false` (i.e., do not
        # stem).
        stemming: nil,
        # The tokenizer to use for full-text search on an attribute.
        tokenizer: nil
      )
      end

      sig do
        override.returns(
          {
            b: Float,
            case_sensitive: T::Boolean,
            k1: Float,
            language: Turbopuffer::Language::OrSymbol,
            remove_stopwords: T::Boolean,
            stemming: T::Boolean,
            tokenizer: Turbopuffer::Tokenizer::OrSymbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
