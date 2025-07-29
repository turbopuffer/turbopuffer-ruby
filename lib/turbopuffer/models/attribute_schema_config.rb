# frozen_string_literal: true

module Turbopuffer
  module Models
    class AttributeSchemaConfig < Turbopuffer::Internal::Type::BaseModel
      # @!attribute ann
      #   Whether to create an approximate nearest neighbor index for the attribute.
      #
      #   @return [Boolean, nil]
      optional :ann, Turbopuffer::Internal::Type::Boolean

      # @!attribute filterable
      #   Whether or not the attributes can be used in filters.
      #
      #   @return [Boolean, nil]
      optional :filterable, Turbopuffer::Internal::Type::Boolean

      # @!attribute full_text_search
      #   Whether this attribute can be used as part of a BM25 full-text search. Requires
      #   the `string` or `[]string` type, and by default, BM25-enabled attributes are not
      #   filterable. You can override this by setting `filterable: true`.
      #
      #   @return [Boolean, Turbopuffer::Models::FullTextSearchConfig, nil]
      optional :full_text_search, union: -> { Turbopuffer::FullTextSearch }

      # @!attribute regex
      #   Whether to enable Regex filters on this attribute.
      #
      #   @return [Boolean, nil]
      optional :regex, Turbopuffer::Internal::Type::Boolean

      # @!attribute type
      #   The data type of the attribute. Valid values: string, int, uint, uuid, datetime,
      #   bool, []string, []int, []uint, []uuid, []datetime, [DIMS]f16, [DIMS]f32.
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(ann: nil, filterable: nil, full_text_search: nil, regex: nil, type: nil)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::AttributeSchemaConfig} for more details.
      #
      #   Detailed configuration for an attribute attached to a document.
      #
      #   @param ann [Boolean] Whether to create an approximate nearest neighbor index for the attribute.
      #
      #   @param filterable [Boolean] Whether or not the attributes can be used in filters.
      #
      #   @param full_text_search [Boolean, Turbopuffer::Models::FullTextSearchConfig] Whether this attribute can be used as part of a BM25 full-text search. Requires
      #
      #   @param regex [Boolean] Whether to enable Regex filters on this attribute.
      #
      #   @param type [String] The data type of the attribute. Valid values: string, int, uint, uuid, datetime,
    end
  end
end
