# frozen_string_literal: true

module Turbopuffer
  module Models
    # Whether to automatically embed this string attribute into a vector attribute.
    # Can be a model name, a detailed configuration object, or `null` to remove an
    # existing embedding configuration.
    module AttributeEmbed
      extend Turbopuffer::Internal::Type::Union

      # The model to use for embedding. If you only specify a model, turbopuffer will generate a vector attribute for you to store the embedding.
      variant String

      # Configuration options for automatic embedding.
      variant -> { Turbopuffer::AttributeEmbedConfig }

      # @!method self.variants
      #   @return [Array(String, Turbopuffer::Models::AttributeEmbedConfig)]
    end
  end
end
