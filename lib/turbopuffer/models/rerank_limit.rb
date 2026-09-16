# frozen_string_literal: true

module Turbopuffer
  module Models
    class RerankLimit < Turbopuffer::Internal::Type::BaseModel
      # @!attribute total
      #   Limits the total number of documents returned after reranking.
      #
      #   @return [Integer]
      required :total, Integer

      # @!method initialize(total:)
      #   Limits the total number of reranked documents returned.
      #
      #   @param total [Integer] Limits the total number of documents returned after reranking.
    end
  end
end
