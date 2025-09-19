# typed: strong

module Turbopuffer
  module Models
    class Bm25ClauseParams < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::Bm25ClauseParams, Turbopuffer::Internal::AnyHash)
        end

      # Whether to treat the last token in the query input as a literal prefix.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :last_as_prefix

      sig { params(last_as_prefix: T::Boolean).void }
      attr_writer :last_as_prefix

      # Additional (optional) parameters for a single BM25 query clause.
      sig { params(last_as_prefix: T::Boolean).returns(T.attached_class) }
      def self.new(
        # Whether to treat the last token in the query input as a literal prefix.
        last_as_prefix: nil
      )
      end

      sig { override.returns({ last_as_prefix: T::Boolean }) }
      def to_hash
      end
    end
  end
end
