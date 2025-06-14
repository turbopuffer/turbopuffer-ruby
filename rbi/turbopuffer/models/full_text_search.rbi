# typed: strong

module Turbopuffer
  module Models
    # Whether this attribute can be used as part of a BM25 full-text search. Requires
    # the `string` or `[]string` type, and by default, BM25-enabled attributes are not
    # filterable. You can override this by setting `filterable: true`.
    module FullTextSearch
      extend Turbopuffer::Internal::Type::Union

      Variants =
        T.type_alias { T.any(T::Boolean, Turbopuffer::FullTextSearchConfig) }

      sig { override.returns(T::Array[Turbopuffer::FullTextSearch::Variants]) }
      def self.variants
      end
    end
  end
end
