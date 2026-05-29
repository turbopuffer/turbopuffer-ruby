# typed: strong

module Turbopuffer
  module Models
    # Whether to automatically embed this string attribute into a vector attribute.
    # Can be a model name, a detailed configuration object, or `null` to remove an
    # existing embedding configuration.
    module AttributeEmbed
      extend Turbopuffer::Internal::Type::Union

      Variants =
        T.type_alias { T.any(String, Turbopuffer::AttributeEmbedConfig) }

      sig { override.returns(T::Array[Turbopuffer::AttributeEmbed::Variants]) }
      def self.variants
      end
    end
  end
end
