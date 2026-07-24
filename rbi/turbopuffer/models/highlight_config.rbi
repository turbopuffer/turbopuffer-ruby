# typed: strong

module Turbopuffer
  module Models
    class HighlightConfig < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::HighlightConfig, Turbopuffer::Internal::AnyHash)
        end

      # How to split a text attribute into fragments for highlighting.
      sig { returns(T.nilable(Turbopuffer::HighlightFragmentBy::OrSymbol)) }
      attr_reader :fragment_by

      sig do
        params(fragment_by: Turbopuffer::HighlightFragmentBy::OrSymbol).void
      end
      attr_writer :fragment_by

      # The maximum number of fragments to return. Defaults to `3`.
      sig { returns(T.nilable(Integer)) }
      attr_reader :fragment_limit

      sig { params(fragment_limit: Integer).void }
      attr_writer :fragment_limit

      # The units to report highlighted fragment offsets in.
      sig { returns(T.nilable(Turbopuffer::HighlightOffsetUnits::OrSymbol)) }
      attr_reader :include_offsets

      sig do
        params(
          include_offsets: Turbopuffer::HighlightOffsetUnits::OrSymbol
        ).void
      end
      attr_writer :include_offsets

      # How to rank candidate fragments within the attribute before selecting the top
      # `fragment_limit`. Defaults to the query's `rank_by`.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :rank_fragments_by

      sig { params(rank_fragments_by: T.anything).void }
      attr_writer :rank_fragments_by

      # Additional (optional) parameters for the Highlight compute expression.
      sig do
        params(
          fragment_by: Turbopuffer::HighlightFragmentBy::OrSymbol,
          fragment_limit: Integer,
          include_offsets: Turbopuffer::HighlightOffsetUnits::OrSymbol,
          rank_fragments_by: T.anything
        ).returns(T.attached_class)
      end
      def self.new(
        # How to split a text attribute into fragments for highlighting.
        fragment_by: nil,
        # The maximum number of fragments to return. Defaults to `3`.
        fragment_limit: nil,
        # The units to report highlighted fragment offsets in.
        include_offsets: nil,
        # How to rank candidate fragments within the attribute before selecting the top
        # `fragment_limit`. Defaults to the query's `rank_by`.
        rank_fragments_by: nil
      )
      end

      sig do
        override.returns(
          {
            fragment_by: Turbopuffer::HighlightFragmentBy::OrSymbol,
            fragment_limit: Integer,
            include_offsets: Turbopuffer::HighlightOffsetUnits::OrSymbol,
            rank_fragments_by: T.anything
          }
        )
      end
      def to_hash
      end
    end
  end
end
