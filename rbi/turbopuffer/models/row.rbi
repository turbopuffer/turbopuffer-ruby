# typed: strong

module Turbopuffer
  module Models
    class Row < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Turbopuffer::Row, Turbopuffer::Internal::AnyHash) }

      # An identifier for a document.
      sig { returns(Turbopuffer::ID::Variants) }
      attr_accessor :id

      # A vector embedding associated with a document.
      sig { returns(T.nilable(Turbopuffer::Vector::Variants)) }
      attr_reader :vector

      sig { params(vector: Turbopuffer::Vector::Variants).void }
      attr_writer :vector

      # A single document, in a row-based format.
      sig do
        params(
          id: Turbopuffer::ID::Variants,
          vector: Turbopuffer::Vector::Variants
        ).returns(T.attached_class)
      end
      def self.new(
        # An identifier for a document.
        id:,
        # A vector embedding associated with a document.
        vector: nil
      )
      end

      sig do
        override.returns(
          {
            id: Turbopuffer::ID::Variants,
            vector: Turbopuffer::Vector::Variants
          }
        )
      end
      def to_hash
      end
    end
  end
end
