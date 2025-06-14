# typed: strong

module Turbopuffer
  module Models
    class NamespaceRecallResponse < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::Models::NamespaceRecallResponse,
            Turbopuffer::Internal::AnyHash
          )
        end

      # The average number of documents retrieved by the approximate nearest neighbor
      # searches.
      sig { returns(Float) }
      attr_accessor :avg_ann_count

      # The average number of documents retrieved by the exhaustive searches.
      sig { returns(Float) }
      attr_accessor :avg_exhaustive_count

      # The average recall of the queries.
      sig { returns(Float) }
      attr_accessor :avg_recall

      # The response to a successful cache warm request.
      sig do
        params(
          avg_ann_count: Float,
          avg_exhaustive_count: Float,
          avg_recall: Float
        ).returns(T.attached_class)
      end
      def self.new(
        # The average number of documents retrieved by the approximate nearest neighbor
        # searches.
        avg_ann_count:,
        # The average number of documents retrieved by the exhaustive searches.
        avg_exhaustive_count:,
        # The average recall of the queries.
        avg_recall:
      )
      end

      sig do
        override.returns(
          {
            avg_ann_count: Float,
            avg_exhaustive_count: Float,
            avg_recall: Float
          }
        )
      end
      def to_hash
      end
    end
  end
end
