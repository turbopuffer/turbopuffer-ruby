# frozen_string_literal: true

module Turbopuffer
  module Models
    # A function used to calculate vector similarity.
    module DistanceMetric
      extend Turbopuffer::Internal::Type::Enum

      # Defined as `1 - cosine_similarity` and ranges from 0 to 2. Lower is better.
      COSINE_DISTANCE = :cosine_distance

      # Defined as `sum((x - y)^2)`. Lower is better.
      EUCLIDEAN_SQUARED = :euclidean_squared

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
