# typed: strong

module Turbopuffer
  module Models
    class DecayParams < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::DecayParams, Turbopuffer::Internal::AnyHash)
        end

      # An exponent that helps further control the shape of the Decay function.
      sig { returns(T.nilable(Float)) }
      attr_reader :exponent

      sig { params(exponent: Float).void }
      attr_writer :exponent

      # The midpoint of the Decay operator.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :midpoint

      sig { params(midpoint: T.anything).void }
      attr_writer :midpoint

      # Additional parameters for the Decay operator.
      sig do
        params(exponent: Float, midpoint: T.anything).returns(T.attached_class)
      end
      def self.new(
        # An exponent that helps further control the shape of the Decay function.
        exponent: nil,
        # The midpoint of the Decay operator.
        midpoint: nil
      )
      end

      sig { override.returns({ exponent: Float, midpoint: T.anything }) }
      def to_hash
      end
    end
  end
end
