# typed: strong

module Turbopuffer
  module Models
    class RrfParams < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::RrfParams, Turbopuffer::Internal::AnyHash)
        end

      # RRF rank constant (`k`). Must be greater than zero. Defaults to `60`.
      sig { returns(T.nilable(Integer)) }
      attr_reader :rank_constant

      sig { params(rank_constant: Integer).void }
      attr_writer :rank_constant

      # A positive weight for each subquery, in the same order as `queries`. The number
      # of weights must match the number of subqueries. When omitted, every subquery has
      # a weight of `1`.
      sig { returns(T.nilable(T::Array[Float])) }
      attr_reader :weights

      sig { params(weights: T::Array[Float]).void }
      attr_writer :weights

      # Configuration options for RRF.
      sig do
        params(rank_constant: Integer, weights: T::Array[Float]).returns(
          T.attached_class
        )
      end
      def self.new(
        # RRF rank constant (`k`). Must be greater than zero. Defaults to `60`.
        rank_constant: nil,
        # A positive weight for each subquery, in the same order as `queries`. The number
        # of weights must match the number of subqueries. When omitted, every subquery has
        # a weight of `1`.
        weights: nil
      )
      end

      sig do
        override.returns({ rank_constant: Integer, weights: T::Array[Float] })
      end
      def to_hash
      end
    end
  end
end
