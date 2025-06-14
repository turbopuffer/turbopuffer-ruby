# typed: strong

module Turbopuffer
  module Models
    # A vector embedding associated with a document.
    module Vector
      extend Turbopuffer::Internal::Type::Union

      Variants = T.type_alias { T.any(T::Array[Float], String) }

      sig { override.returns(T::Array[Turbopuffer::Vector::Variants]) }
      def self.variants
      end

      FloatArray =
        T.let(
          Turbopuffer::Internal::Type::ArrayOf[Float],
          Turbopuffer::Internal::Type::Converter
        )
    end
  end
end
