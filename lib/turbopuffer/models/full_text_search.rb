# frozen_string_literal: true

module Turbopuffer
  module Models
    # Whether this attribute can be used as part of a BM25 full-text search. Requires
    # the `string` or `[]string` type, and by default, BM25-enabled attributes are not
    # filterable. You can override this by setting `filterable: true`.
    module FullTextSearch
      extend Turbopuffer::Internal::Type::Union

      variant Turbopuffer::Internal::Type::Boolean

      # Configuration options for full-text search.
      variant -> { Turbopuffer::FullTextSearchConfig }

      # @!method self.variants
      #   @return [Array(Boolean, Turbopuffer::Models::FullTextSearchConfig)]
    end
  end
end
