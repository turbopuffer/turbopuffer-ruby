# typed: strong

module Turbopuffer
  module Models
    class EmbedParams < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::EmbedParams, Turbopuffer::Internal::AnyHash)
        end

      # The model to use for embedding, overriding the model configured for the
      # attribute.
      sig { returns(T.nilable(String)) }
      attr_reader :model

      sig { params(model: String).void }
      attr_writer :model

      # Additional (optional) parameters for the Embed expression.
      sig { params(model: String).returns(T.attached_class) }
      def self.new(
        # The model to use for embedding, overriding the model configured for the
        # attribute.
        model: nil
      )
      end

      sig { override.returns({ model: String }) }
      def to_hash
      end
    end
  end
end
