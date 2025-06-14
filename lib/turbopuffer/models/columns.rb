# frozen_string_literal: true

module Turbopuffer
  module Models
    class Columns < Turbopuffer::Internal::Type::BaseModel
      # @!attribute id
      #   The IDs of the documents.
      #
      #   @return [Array<String, Integer>]
      required :id, -> { Turbopuffer::Internal::Type::ArrayOf[union: Turbopuffer::ID] }

      # @!attribute vector
      #   The vector embeddings of the documents.
      #
      #   @return [Array<Array<Float>, String>, Array<Float>, String, nil]
      optional :vector, union: -> { Turbopuffer::Columns::Vector }

      # @!method initialize(id:, vector: nil)
      #   A list of documents in columnar format. Each key is a column name, mapped to an
      #   array of values for that column.
      #
      #   @param id [Array<String, Integer>] The IDs of the documents.
      #
      #   @param vector [Array<Array<Float>, String>, Array<Float>, String] The vector embeddings of the documents.

      # The vector embeddings of the documents.
      #
      # @see Turbopuffer::Models::Columns#vector
      module Vector
        extend Turbopuffer::Internal::Type::Union

        # The vector embeddings of the documents.
        variant -> { Turbopuffer::Models::Columns::Vector::VectorArray }

        # A dense vector encoded as an array of floats.
        variant -> { Turbopuffer::Models::Columns::Vector::FloatArray }

        # A dense vector encoded as a base64 string.
        variant String

        # @!method self.variants
        #   @return [Array(Array<Array<Float>, String>, Array<Float>, String)]

        # @type [Turbopuffer::Internal::Type::Converter]
        VectorArray = Turbopuffer::Internal::Type::ArrayOf[union: -> { Turbopuffer::Vector }]

        # @type [Turbopuffer::Internal::Type::Converter]
        FloatArray = Turbopuffer::Internal::Type::ArrayOf[Float]
      end
    end
  end
end
