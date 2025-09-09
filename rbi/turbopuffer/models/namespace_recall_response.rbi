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

      # Ground truth data including query vectors and true nearest neighbors. Only
      # included when include_ground_truth is true.
      sig do
        returns(
          T.nilable(
            T::Array[Turbopuffer::Models::NamespaceRecallResponse::GroundTruth]
          )
        )
      end
      attr_reader :ground_truth

      sig do
        params(
          ground_truth:
            T::Array[
              Turbopuffer::Models::NamespaceRecallResponse::GroundTruth::OrHash
            ]
        ).void
      end
      attr_writer :ground_truth

      # The response to a successful cache warm request.
      sig do
        params(
          avg_ann_count: Float,
          avg_exhaustive_count: Float,
          avg_recall: Float,
          ground_truth:
            T::Array[
              Turbopuffer::Models::NamespaceRecallResponse::GroundTruth::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(
        # The average number of documents retrieved by the approximate nearest neighbor
        # searches.
        avg_ann_count:,
        # The average number of documents retrieved by the exhaustive searches.
        avg_exhaustive_count:,
        # The average recall of the queries.
        avg_recall:,
        # Ground truth data including query vectors and true nearest neighbors. Only
        # included when include_ground_truth is true.
        ground_truth: nil
      )
      end

      sig do
        override.returns(
          {
            avg_ann_count: Float,
            avg_exhaustive_count: Float,
            avg_recall: Float,
            ground_truth:
              T::Array[
                Turbopuffer::Models::NamespaceRecallResponse::GroundTruth
              ]
          }
        )
      end
      def to_hash
      end

      class GroundTruth < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::Models::NamespaceRecallResponse::GroundTruth,
              Turbopuffer::Internal::AnyHash
            )
          end

        # The true nearest neighbors with their distances and vectors.
        sig { returns(T::Array[Turbopuffer::Row]) }
        attr_accessor :nearest_neighbors

        # The query vector used for this search.
        sig { returns(T::Array[Float]) }
        attr_accessor :query_vector

        sig do
          params(
            nearest_neighbors: T::Array[Turbopuffer::Row::OrHash],
            query_vector: T::Array[Float]
          ).returns(T.attached_class)
        end
        def self.new(
          # The true nearest neighbors with their distances and vectors.
          nearest_neighbors:,
          # The query vector used for this search.
          query_vector:
        )
        end

        sig do
          override.returns(
            {
              nearest_neighbors: T::Array[Turbopuffer::Row],
              query_vector: T::Array[Float]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
