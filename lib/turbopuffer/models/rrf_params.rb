# frozen_string_literal: true

module Turbopuffer
  module Models
    class RrfParams < Turbopuffer::Internal::Type::BaseModel
      # @!attribute rank_constant
      #   RRF rank constant (`k`). Must be greater than zero. Defaults to `60`.
      #
      #   @return [Integer, nil]
      optional :rank_constant, Integer

      # @!attribute weights
      #   A positive weight for each subquery, in the same order as `queries`. The number
      #   of weights must match the number of subqueries. When omitted, every subquery has
      #   a weight of `1`.
      #
      #   @return [Array<Float>, nil]
      optional :weights, Turbopuffer::Internal::Type::ArrayOf[Float]

      # @!method initialize(rank_constant: nil, weights: nil)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::RrfParams} for more details.
      #
      #   Configuration options for RRF.
      #
      #   @param rank_constant [Integer] RRF rank constant (`k`). Must be greater than zero. Defaults to `60`.
      #
      #   @param weights [Array<Float>] A positive weight for each subquery, in the same order as `queries`. The number
    end
  end
end
