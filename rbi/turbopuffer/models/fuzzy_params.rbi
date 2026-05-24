# typed: strong

module Turbopuffer
  module Models
    class FuzzyParams < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::FuzzyParams, Turbopuffer::Internal::AnyHash)
        end

      # Maximum edit distance allowed at each query length. Queries shorter than the
      # first threshold return no matches.
      sig { returns(T::Array[Turbopuffer::FuzzyMaxEditDistance]) }
      attr_accessor :max_edit_distance

      # Additional parameters for the Fuzzy filter.
      sig do
        params(
          max_edit_distance: T::Array[Turbopuffer::FuzzyMaxEditDistance::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Maximum edit distance allowed at each query length. Queries shorter than the
        # first threshold return no matches.
        max_edit_distance:
      )
      end

      sig do
        override.returns(
          { max_edit_distance: T::Array[Turbopuffer::FuzzyMaxEditDistance] }
        )
      end
      def to_hash
      end
    end
  end
end
