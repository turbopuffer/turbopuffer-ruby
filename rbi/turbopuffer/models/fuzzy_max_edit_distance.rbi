# typed: strong

module Turbopuffer
  module Models
    class FuzzyMaxEditDistance < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::FuzzyMaxEditDistance,
            Turbopuffer::Internal::AnyHash
          )
        end

      # The maximum edit distance to allow.
      sig { returns(Integer) }
      attr_accessor :distance

      # Minimum number of characters in a query where this distance applies. Must be at
      # least 3 · (distance + 1).
      sig { returns(Integer) }
      attr_accessor :min_query_chars

      # An edit distance threshold for the Fuzzy filter.
      sig do
        params(distance: Integer, min_query_chars: Integer).returns(
          T.attached_class
        )
      end
      def self.new(
        # The maximum edit distance to allow.
        distance:,
        # Minimum number of characters in a query where this distance applies. Must be at
        # least 3 · (distance + 1).
        min_query_chars:
      )
      end

      sig { override.returns({ distance: Integer, min_query_chars: Integer }) }
      def to_hash
      end
    end
  end
end
