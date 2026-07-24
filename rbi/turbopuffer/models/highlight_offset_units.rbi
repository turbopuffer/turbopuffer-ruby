# typed: strong

module Turbopuffer
  module Models
    # The units to report highlighted fragment offsets in.
    module HighlightOffsetUnits
      extend Turbopuffer::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Turbopuffer::HighlightOffsetUnits) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      UTF_8 = T.let(:"utf-8", Turbopuffer::HighlightOffsetUnits::TaggedSymbol)
      UTF_16 = T.let(:"utf-16", Turbopuffer::HighlightOffsetUnits::TaggedSymbol)
      CODEPOINTS =
        T.let(:codepoints, Turbopuffer::HighlightOffsetUnits::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Turbopuffer::HighlightOffsetUnits::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
