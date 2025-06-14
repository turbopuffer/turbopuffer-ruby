# frozen_string_literal: true

module Turbopuffer
  module Models
    # A vector embedding associated with a document.
    module Vector
      extend Turbopuffer::Internal::Type::Union

      # A dense vector encoded as an array of floats.
      variant -> { Turbopuffer::Models::Vector::FloatArray }

      # A dense vector encoded as a base64 string.
      variant String

      # @!method self.variants
      #   @return [Array(Array<Float>, String)]

      # @type [Turbopuffer::Internal::Type::Converter]
      FloatArray = Turbopuffer::Internal::Type::ArrayOf[Float]
    end
  end
end
