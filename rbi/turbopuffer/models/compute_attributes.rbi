# typed: strong

module Turbopuffer
  module Models
    # An expression describing how to compute an additional attribute on documents
    # returned by a query.
    module ComputeAttributes
      extend Turbopuffer::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            T::Array[T.anything],
            T::Array[T.anything],
            T::Array[T.anything],
            T.anything
          )
        end

      sig do
        override.returns(T::Array[Turbopuffer::ComputeAttributes::Variants])
      end
      def self.variants
      end

      VectorDist =
        T.let(
          Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Internal::Type::Unknown],
          Turbopuffer::Internal::Type::Converter
        )

      Highlight =
        T.let(
          Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Internal::Type::Unknown],
          Turbopuffer::Internal::Type::Converter
        )

      HighlightWithConfig =
        T.let(
          Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Internal::Type::Unknown],
          Turbopuffer::Internal::Type::Converter
        )
    end
  end
end
