# typed: strong

module Turbopuffer
  module Models
    class RerankLimit < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::RerankLimit, Turbopuffer::Internal::AnyHash)
        end

      # Limits the total number of documents returned after reranking.
      sig { returns(Integer) }
      attr_accessor :total

      # Limits the total number of reranked documents returned.
      sig { params(total: Integer).returns(T.attached_class) }
      def self.new(
        # Limits the total number of documents returned after reranking.
        total:
      )
      end

      sig { override.returns({ total: Integer }) }
      def to_hash
      end
    end
  end
end
