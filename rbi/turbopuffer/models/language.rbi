# typed: strong

module Turbopuffer
  module Models
    # Describes the language of a text attribute. Defaults to `english`.
    module Language
      extend Turbopuffer::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Turbopuffer::Language) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      ARABIC = T.let(:arabic, Turbopuffer::Language::TaggedSymbol)
      DANISH = T.let(:danish, Turbopuffer::Language::TaggedSymbol)
      DUTCH = T.let(:dutch, Turbopuffer::Language::TaggedSymbol)
      ENGLISH = T.let(:english, Turbopuffer::Language::TaggedSymbol)
      FINNISH = T.let(:finnish, Turbopuffer::Language::TaggedSymbol)
      FRENCH = T.let(:french, Turbopuffer::Language::TaggedSymbol)
      GERMAN = T.let(:german, Turbopuffer::Language::TaggedSymbol)
      GREEK = T.let(:greek, Turbopuffer::Language::TaggedSymbol)
      HUNGARIAN = T.let(:hungarian, Turbopuffer::Language::TaggedSymbol)
      ITALIAN = T.let(:italian, Turbopuffer::Language::TaggedSymbol)
      NORWEGIAN = T.let(:norwegian, Turbopuffer::Language::TaggedSymbol)
      PORTUGUESE = T.let(:portuguese, Turbopuffer::Language::TaggedSymbol)
      ROMANIAN = T.let(:romanian, Turbopuffer::Language::TaggedSymbol)
      RUSSIAN = T.let(:russian, Turbopuffer::Language::TaggedSymbol)
      SPANISH = T.let(:spanish, Turbopuffer::Language::TaggedSymbol)
      SWEDISH = T.let(:swedish, Turbopuffer::Language::TaggedSymbol)
      TAMIL = T.let(:tamil, Turbopuffer::Language::TaggedSymbol)
      TURKISH = T.let(:turkish, Turbopuffer::Language::TaggedSymbol)

      sig { override.returns(T::Array[Turbopuffer::Language::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
