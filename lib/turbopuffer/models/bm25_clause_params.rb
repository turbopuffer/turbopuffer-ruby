# frozen_string_literal: true

module Turbopuffer
  module Models
    class Bm25ClauseParams < Turbopuffer::Internal::Type::BaseModel
      # @!attribute last_as_prefix
      #   Whether to treat the last token in the query input as a literal prefix.
      #
      #   @return [Boolean, nil]
      optional :last_as_prefix, Turbopuffer::Internal::Type::Boolean

      # @!method initialize(last_as_prefix: nil)
      #   Additional (optional) parameters for a single BM25 query clause.
      #
      #   @param last_as_prefix [Boolean] Whether to treat the last token in the query input as a literal prefix.
    end
  end
end
