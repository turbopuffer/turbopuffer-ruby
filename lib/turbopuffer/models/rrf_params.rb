# frozen_string_literal: true

module Turbopuffer
  module Models
    class RrfParams < Turbopuffer::Internal::Type::BaseModel
      # @!attribute rank_constant
      #   RRF rank constant (`k`). Must be greater than zero. Defaults to `60`.
      #
      #   @return [Integer, nil]
      optional :rank_constant, Integer

      # @!method initialize(rank_constant: nil)
      #   Configuration options for RRF.
      #
      #   @param rank_constant [Integer] RRF rank constant (`k`). Must be greater than zero. Defaults to `60`.
    end
  end
end
