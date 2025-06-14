# typed: strong

module Turbopuffer
  module Models
    # A function used to calculate vector similarity.
    module DistanceMetric
      extend Turbopuffer::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Turbopuffer::DistanceMetric) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      # Defined as `1 - cosine_similarity` and ranges from 0 to 2. Lower is better.
      COSINE_DISTANCE =
        T.let(:cosine_distance, Turbopuffer::DistanceMetric::TaggedSymbol)

      # Defined as `sum((x - y)^2)`. Lower is better.
      EUCLIDEAN_SQUARED =
        T.let(:euclidean_squared, Turbopuffer::DistanceMetric::TaggedSymbol)

      sig do
        override.returns(T::Array[Turbopuffer::DistanceMetric::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
