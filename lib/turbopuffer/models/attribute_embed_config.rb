# frozen_string_literal: true

module Turbopuffer
  module Models
    class AttributeEmbedConfig < Turbopuffer::Internal::Type::BaseModel
      # @!attribute model
      #   The model to use for embedding. See our documentation for a list of models
      #   supported in each region.
      #
      #   @return [String]
      required :model, String

      # @!attribute attribute
      #   The name of an existing vector attribute to store embeddings in. If omitted,
      #   turbopuffer will generate a computed vector attribute named
      #   `$embed_<attribute>`.
      #
      #   @return [String, nil]
      optional :attribute, String

      # @!attribute dims
      #   The dimensionality to embed at. If not set, will pick the default for this
      #   model. If you're storing embeddings in an existing attribute, this can be
      #   omitted, and may not be set to a value other than the dimensions of that
      #   attribute.
      #
      #   @return [Integer, nil]
      optional :dims, Integer

      # @!method initialize(model:, attribute: nil, dims: nil)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::AttributeEmbedConfig} for more details.
      #
      #   Configuration options for automatic embedding.
      #
      #   @param model [String] The model to use for embedding. See our documentation for a list of models suppo
      #
      #   @param attribute [String] The name of an existing vector attribute to store embeddings in. If omitted, tur
      #
      #   @param dims [Integer] The dimensionality to embed at. If not set, will pick the default for this model
    end
  end
end
