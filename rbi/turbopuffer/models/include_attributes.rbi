# typed: strong

module Turbopuffer
  module Models
    # Whether to include attributes in the response.
    module IncludeAttributes
      extend Turbopuffer::Internal::Type::Union

      Variants = T.type_alias { T.any(T::Boolean, T::Array[String]) }

      sig do
        override.returns(T::Array[Turbopuffer::IncludeAttributes::Variants])
      end
      def self.variants
      end

      StringArray =
        T.let(
          Turbopuffer::Internal::Type::ArrayOf[String],
          Turbopuffer::Internal::Type::Converter
        )
    end
  end
end
