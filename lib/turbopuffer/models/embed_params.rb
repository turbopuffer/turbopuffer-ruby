# frozen_string_literal: true

module Turbopuffer
  module Models
    class EmbedParams < Turbopuffer::Internal::Type::BaseModel
      # @!attribute model
      #   The model to use for embedding, overriding the model configured for the
      #   attribute.
      #
      #   @return [String, nil]
      optional :model, String

      # @!method initialize(model: nil)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::EmbedParams} for more details.
      #
      #   Additional (optional) parameters for the Embed expression.
      #
      #   @param model [String] The model to use for embedding, overriding the model configured for the attribut
    end
  end
end
