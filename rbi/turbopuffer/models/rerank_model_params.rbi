# typed: strong

module Turbopuffer
  module Models
    class RerankModelParams < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::RerankModelParams, Turbopuffer::Internal::AnyHash)
        end

      # The string attribute to score. Must be included in `include_attributes` in every
      # query.
      sig { returns(String) }
      attr_accessor :attribute

      # The reranking model to use, for example `voyage/rerank-3`. See
      # https://turbopuffer.com/docs/reranking#models for the available models.
      sig { returns(String) }
      attr_accessor :model

      # The query text to score each document against.
      sig { returns(String) }
      attr_accessor :query

      # Rerank retrieved candidates with a model.
      sig do
        params(attribute: String, model: String, query: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # The string attribute to score. Must be included in `include_attributes` in every
        # query.
        attribute:,
        # The reranking model to use, for example `voyage/rerank-3`. See
        # https://turbopuffer.com/docs/reranking#models for the available models.
        model:,
        # The query text to score each document against.
        query:
      )
      end

      sig do
        override.returns({ attribute: String, model: String, query: String })
      end
      def to_hash
      end
    end
  end
end
