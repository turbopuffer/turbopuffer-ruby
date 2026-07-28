# frozen_string_literal: true

module Turbopuffer
  module Models
    # An expression describing how to compute an additional attribute on documents
    # returned by a query.
    #
    # Each variant is a positional expression, encoded as a heterogeneous array (a
    # "tuple"). This union is a hand-written per-SDK override (see the "Path B"
    # experiment) that mirrors the `ComputeAttributes` `anyOf` in the OpenAPI spec,
    # which the generator currently emits as an opaque object.
    module ComputeAttributes
      extend Turbopuffer::Internal::Type::Union

      # The distance between a vector attribute and a query vector, encoded as
      # `[attr, "VectorDist", value]`.
      variant -> { Turbopuffer::Models::ComputeAttributes::VectorDist }

      # Highlights matching fragments of a text attribute, encoded as
      # `["Highlight", attr]`.
      variant -> { Turbopuffer::Models::ComputeAttributes::Highlight }

      # Highlights matching fragments of a text attribute, with additional
      # configuration, encoded as `["Highlight", attr, config]`.
      variant -> { Turbopuffer::Models::ComputeAttributes::HighlightWithConfig }

      # A ranking expression (`RankBy`) whose score is materialized as an attribute.
      # `rank_by` is currently untyped in this SDK, so the score expression is left
      # opaque here.
      variant Turbopuffer::Internal::Type::Unknown

      # @!method self.variants
      #   @return [Array(Array<Object>, Array<Object>, Array<Object>, Object)]

      # The distance between a vector attribute and a query vector, encoded as the
      # tuple `[attr, "VectorDist", value]`.
      #
      # @type [Turbopuffer::Internal::Type::Converter]
      VectorDist = Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Internal::Type::Unknown]

      # Highlights matching fragments of a text attribute, encoded as the tuple
      # `["Highlight", attr]`.
      #
      # @type [Turbopuffer::Internal::Type::Converter]
      Highlight = Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Internal::Type::Unknown]

      # Highlights matching fragments of a text attribute, with additional
      # configuration, encoded as the tuple `["Highlight", attr, config]`.
      #
      # @type [Turbopuffer::Internal::Type::Converter]
      HighlightWithConfig = Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Internal::Type::Unknown]
    end
  end
end
