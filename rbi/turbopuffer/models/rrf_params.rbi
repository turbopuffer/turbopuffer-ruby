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

      # Configuration options for RRF.
      sig { params(rank_constant: Integer).returns(T.attached_class) }
      def self.new(
        # RRF rank constant (`k`). Must be greater than zero. Defaults to `60`.
        rank_constant: nil
      )
      end

      sig { override.returns({ rank_constant: Integer }) }
      def to_hash
      end
    end
  end
end
