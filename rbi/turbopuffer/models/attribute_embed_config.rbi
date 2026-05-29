# typed: strong

module Turbopuffer
  module Models
    class AttributeEmbedConfig < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::AttributeEmbedConfig,
            Turbopuffer::Internal::AnyHash
          )
        end

      # The model to use for embedding. See our documentation for a list of models
      # supported in each region.
      sig { returns(String) }
      attr_accessor :model

      # The name of an existing vector attribute to store embeddings in. If omitted,
      # turbopuffer will generate a computed vector attribute named
      # `$embed_<attribute>`.
      sig { returns(T.nilable(String)) }
      attr_reader :attribute

      sig { params(attribute: String).void }
      attr_writer :attribute

      # The dimensionality to embed at. If not set, will pick the default for this
      # model. If you're storing embeddings in an existing attribute, this can be
      # omitted, and may not be set to a value other than the dimensions of that
      # attribute.
      sig { returns(T.nilable(Integer)) }
      attr_reader :dims

      sig { params(dims: Integer).void }
      attr_writer :dims

      # Configuration options for automatic embedding.
      sig do
        params(model: String, attribute: String, dims: Integer).returns(
          T.attached_class
        )
      end
      def self.new(
        # The model to use for embedding. See our documentation for a list of models
        # supported in each region.
        model:,
        # The name of an existing vector attribute to store embeddings in. If omitted,
        # turbopuffer will generate a computed vector attribute named
        # `$embed_<attribute>`.
        attribute: nil,
        # The dimensionality to embed at. If not set, will pick the default for this
        # model. If you're storing embeddings in an existing attribute, this can be
        # omitted, and may not be set to a value other than the dimensions of that
        # attribute.
        dims: nil
      )
      end

      sig do
        override.returns({ model: String, attribute: String, dims: Integer })
      end
      def to_hash
      end
    end
  end
end
