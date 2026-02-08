# frozen_string_literal: true

module Turbopuffer
  module Models
    class Limit < Turbopuffer::Internal::Type::BaseModel
      # @!attribute total
      #   Limits the total number of documents returned.
      #
      #   @return [Integer]
      required :total, Integer

      # @!attribute per
      #   Limits the number of documents with the same value for a set of attributes (the
      #   "limit key") that can appear in the results.
      #
      #   @return [Turbopuffer::Models::Limit::Per, nil]
      optional :per, -> { Turbopuffer::Limit::Per }

      # @!method initialize(total:, per: nil)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::Limit} for more details.
      #
      #   Limits the documents returned by a query.
      #
      #   @param total [Integer] Limits the total number of documents returned.
      #
      #   @param per [Turbopuffer::Models::Limit::Per] Limits the number of documents with the same value for a set of attributes (the

      # @see Turbopuffer::Models::Limit#per
      class Per < Turbopuffer::Internal::Type::BaseModel
        # @!attribute attributes
        #   The attributes to include in the limit key.
        #
        #   @return [Array<String>]
        required :attributes, Turbopuffer::Internal::Type::ArrayOf[String]

        # @!attribute limit
        #   The maximum number of documents to return for each value of the limit key.
        #
        #   @return [Integer]
        required :limit, Integer

        # @!method initialize(attributes:, limit:)
        #   Some parameter documentations has been truncated, see
        #   {Turbopuffer::Models::Limit::Per} for more details.
        #
        #   Limits the number of documents with the same value for a set of attributes (the
        #   "limit key") that can appear in the results.
        #
        #   @param attributes [Array<String>] The attributes to include in the limit key.
        #
        #   @param limit [Integer] The maximum number of documents to return for each value of the limit key.
      end
    end
  end
end
