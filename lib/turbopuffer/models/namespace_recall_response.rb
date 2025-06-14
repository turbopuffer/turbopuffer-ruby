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

      # @!method initialize(avg_ann_count:, avg_exhaustive_count:, avg_recall:)
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
    end
  end
end
