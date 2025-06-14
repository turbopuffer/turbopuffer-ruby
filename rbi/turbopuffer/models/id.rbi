# typed: strong

module Turbopuffer
  module Models
    # An identifier for a document.
    module ID
      extend Turbopuffer::Internal::Type::Union

      Variants = T.type_alias { T.any(String, Integer) }

      sig { override.returns(T::Array[Turbopuffer::ID::Variants]) }
      def self.variants
      end
    end
  end
end
