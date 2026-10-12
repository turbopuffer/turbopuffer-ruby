# frozen_string_literal: true

module Turbopuffer
  module Models
    class RerankModelParams < Turbopuffer::Internal::Type::BaseModel
      # @!attribute attribute
      #   The string attribute to score. Must be included in `include_attributes` in every
      #   query.
      #
      #   @return [String]
      required :attribute, String

      # @!attribute model
      #   The reranking model to use.
      #
      #   @return [String]
      required :model, String

      # @!attribute query
      #   The query text to score each document against.
      #
      #   @return [String]
      required :query, String

      # @!method initialize(attribute:, model:, query:)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::RerankModelParams} for more details.
      #
      #   Rerank retrieved candidates with a model.
      #
      #   @param attribute [String] The string attribute to score. Must be included in `include_attributes` in every
      #
      #   @param model [String] The reranking model to use.
      #
      #   @param query [String] The query text to score each document against.
    end
  end
end
