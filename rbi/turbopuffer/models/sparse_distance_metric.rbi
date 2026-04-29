# typed: strong

module Turbopuffer
  module Models
    # A function used to calculate sparse vector similarity.
    module SparseDistanceMetric
      extend Turbopuffer::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Turbopuffer::SparseDistanceMetric) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      DOT_PRODUCT =
        T.let(:dot_product, Turbopuffer::SparseDistanceMetric::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Turbopuffer::SparseDistanceMetric::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
