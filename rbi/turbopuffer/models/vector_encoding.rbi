# typed: strong

module Turbopuffer
  module Models
    # The encoding to use for vectors in the response.
    module VectorEncoding
      extend Turbopuffer::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Turbopuffer::VectorEncoding) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      FLOAT = T.let(:float, Turbopuffer::VectorEncoding::TaggedSymbol)
      BASE64 = T.let(:base64, Turbopuffer::VectorEncoding::TaggedSymbol)

      sig do
        override.returns(T::Array[Turbopuffer::VectorEncoding::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
