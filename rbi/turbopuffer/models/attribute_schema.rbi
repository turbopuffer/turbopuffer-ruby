# typed: strong

module Turbopuffer
  module Models
    # The schema for an attribute attached to a document.
    module AttributeSchema
      extend Turbopuffer::Internal::Type::Union

      Variants =
        T.type_alias { T.any(String, Turbopuffer::AttributeSchemaConfig) }

      sig { override.returns(T::Array[Turbopuffer::AttributeSchema::Variants]) }
      def self.variants
      end
    end
  end
end
