# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#recall
    class NamespaceRecallResponse < Turbopuffer::Internal::Type::BaseModel
      # @!attribute avg_ann_count
      #   The average number of documents retrieved by the approximate nearest neighbor
      #   searches.
      #
      #   @return [Float]
      required :avg_ann_count, Float

      # @!attribute avg_exhaustive_count
      #   The average number of documents retrieved by the exhaustive searches.
      #
      #   @return [Float]
      required :avg_exhaustive_count, Float

      # @!attribute avg_recall
      #   The average recall of the queries.
      #
      #   @return [Float]
      required :avg_recall, Float

      # @!attribute ground_truth
      #   Ground truth data including query vectors and true nearest neighbors. Only
      #   included when include_ground_truth is true.
      #
      #   @return [Array<Turbopuffer::Models::NamespaceRecallResponse::GroundTruth>, nil]
      optional :ground_truth,
               -> { Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Models::NamespaceRecallResponse::GroundTruth] }

      # @!method initialize(avg_ann_count:, avg_exhaustive_count:, avg_recall:, ground_truth: nil)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::NamespaceRecallResponse} for more details.
      #
      #   The response to a successful cache warm request.
      #
      #   @param avg_ann_count [Float] The average number of documents retrieved by the approximate nearest neighbor se
      #
      #   @param avg_exhaustive_count [Float] The average number of documents retrieved by the exhaustive searches.
      #
      #   @param avg_recall [Float] The average recall of the queries.
      #
      #   @param ground_truth [Array<Turbopuffer::Models::NamespaceRecallResponse::GroundTruth>] Ground truth data including query vectors and true nearest neighbors. Only inclu

      class GroundTruth < Turbopuffer::Internal::Type::BaseModel
        # @!attribute nearest_neighbors
        #   The true nearest neighbors with their distances and vectors.
        #
        #   @return [Array<Turbopuffer::Models::Row>]
        required :nearest_neighbors, -> { Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Row] }

        # @!attribute query_vector
        #   The query vector used for this search.
        #
        #   @return [Array<Float>]
        required :query_vector, Turbopuffer::Internal::Type::ArrayOf[Float]

        # @!method initialize(nearest_neighbors:, query_vector:)
        #   @param nearest_neighbors [Array<Turbopuffer::Models::Row>] The true nearest neighbors with their distances and vectors.
        #
        #   @param query_vector [Array<Float>] The query vector used for this search.
      end
    end
  end
end
