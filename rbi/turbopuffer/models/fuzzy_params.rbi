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

      # Whether searching with Fuzzy filter is case-sensitive. Defaults to `true` (i.e.
      # case-sensitive).
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :case_sensitive

      sig { params(case_sensitive: T::Boolean).void }
      attr_writer :case_sensitive

      # Additional parameters for the Fuzzy filter.
      sig do
        params(
          max_edit_distance:
            T::Array[Turbopuffer::FuzzyMaxEditDistance::OrHash],
          case_sensitive: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Maximum edit distance allowed at each query length. Queries shorter than the
        # first threshold return no matches.
        max_edit_distance:,
        # Whether searching with Fuzzy filter is case-sensitive. Defaults to `true` (i.e.
        # case-sensitive).
        case_sensitive: nil
      )
      end

      sig do
        override.returns(
          {
            max_edit_distance: T::Array[Turbopuffer::FuzzyMaxEditDistance],
            case_sensitive: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end
