# typed: strong

module Turbopuffer
  module Models
    class Columns < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::Columns, Turbopuffer::Internal::AnyHash)
        end

      # The IDs of the documents.
      sig { returns(T::Array[Turbopuffer::ID::Variants]) }
      attr_accessor :id

      # The vector embeddings of the documents.
      sig { returns(T.nilable(Turbopuffer::Columns::Vector::Variants)) }
      attr_reader :vector

      sig { params(vector: Turbopuffer::Columns::Vector::Variants).void }
      attr_writer :vector

      # A list of documents in columnar format. Each key is a column name, mapped to an
      # array of values for that column.
      sig do
        params(
          id: T::Array[Turbopuffer::ID::Variants],
          vector: Turbopuffer::Columns::Vector::Variants
        ).returns(T.attached_class)
      end
      def self.new(
        # The IDs of the documents.
        id:,
        # The vector embeddings of the documents.
        vector: nil
      )
      end

      sig do
        override.returns(
          {
            id: T::Array[Turbopuffer::ID::Variants],
            vector: Turbopuffer::Columns::Vector::Variants
          }
        )
      end
      def to_hash
      end

      # The vector embeddings of the documents.
      module Vector
        extend Turbopuffer::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              T::Array[Turbopuffer::Vector::Variants],
              T::Array[Float],
              String
            )
          end

        sig do
          override.returns(T::Array[Turbopuffer::Columns::Vector::Variants])
        end
        def self.variants
        end

        VectorArray =
          T.let(
            Turbopuffer::Internal::Type::ArrayOf[union: Turbopuffer::Vector],
            Turbopuffer::Internal::Type::Converter
          )

        FloatArray =
          T.let(
            Turbopuffer::Internal::Type::ArrayOf[Float],
            Turbopuffer::Internal::Type::Converter
          )
      end
    end
  end
end
