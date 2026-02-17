# frozen_string_literal: true

module Turbopuffer
  module Models
    class DecayParams < Turbopuffer::Internal::Type::BaseModel
      # @!attribute exponent
      #   An exponent that helps further control the shape of the Decay function.
      #
      #   @return [Float, nil]
      optional :exponent, Float

      # @!attribute midpoint
      #   The midpoint of the Decay operator.
      #
      #   @return [Object, nil]
      optional :midpoint, Turbopuffer::Internal::Type::Unknown

      # @!method initialize(exponent: nil, midpoint: nil)
      #   Additional parameters for the Decay operator.
      #
      #   @param exponent [Float] An exponent that helps further control the shape of the Decay function.
      #
      #   @param midpoint [Object] The midpoint of the Decay operator.
    end
  end
end
