# frozen_string_literal: true

module Turbopuffer
  module Models
    class SaturateParams < Turbopuffer::Internal::Type::BaseModel
      # @!attribute exponent
      #   An exponent that helps further control the shape of the Saturate function.
      #
      #   @return [Float, nil]
      optional :exponent, Float

      # @!attribute midpoint
      #   The midpoint of the Saturate operator.
      #
      #   @return [Object, nil]
      optional :midpoint, Turbopuffer::Internal::Type::Unknown

      # @!method initialize(exponent: nil, midpoint: nil)
      #   Additional parameters for the Saturate operator.
      #
      #   @param exponent [Float] An exponent that helps further control the shape of the Saturate function.
      #
      #   @param midpoint [Object] The midpoint of the Saturate operator.
    end
  end
end
