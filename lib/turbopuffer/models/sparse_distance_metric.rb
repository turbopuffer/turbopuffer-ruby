# frozen_string_literal: true

module Turbopuffer
  module Models
    # A function used to calculate sparse vector similarity.
    module SparseDistanceMetric
      extend Turbopuffer::Internal::Type::Enum

      DOT_PRODUCT = :dot_product

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
