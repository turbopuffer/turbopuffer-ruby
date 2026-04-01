# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#recall
    class NamespaceRecallParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      # @!attribute namespace
      #
      #   @return [String, nil]
      optional :namespace, String

      # @!attribute filters
      #   Filter by attributes. Same syntax as the query endpoint.
      #
      #   @return [Object, nil]
      optional :filters, Turbopuffer::Internal::Type::Unknown

      # @!attribute include_ground_truth
      #   Include ground truth data (query vectors and true nearest neighbors) in the
      #   response.
      #
      #   @return [Boolean, nil]
      optional :include_ground_truth, Turbopuffer::Internal::Type::Boolean

      # @!attribute num
      #   The number of searches to run.
      #
      #   @return [Integer, nil]
      optional :num, Integer

      # @!attribute rank_by
      #   The ranking function to evaluate recall for. If provided, `num` must be either
      #   null or 1.
      #
      #   @return [Object, nil]
      optional :rank_by, Turbopuffer::Internal::Type::Unknown

      # @!attribute top_k
      #   Search for `top_k` nearest neighbors.
      #
      #   @return [Integer, nil]
      optional :top_k, Integer

      # @!method initialize(namespace: nil, filters: nil, include_ground_truth: nil, num: nil, rank_by: nil, top_k: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::NamespaceRecallParams} for more details.
      #
      #   @param namespace [String]
      #
      #   @param filters [Object] Filter by attributes. Same syntax as the query endpoint.
      #
      #   @param include_ground_truth [Boolean] Include ground truth data (query vectors and true nearest neighbors) in the resp
      #
      #   @param num [Integer] The number of searches to run.
      #
      #   @param rank_by [Object] The ranking function to evaluate recall for. If provided, `num` must be either n
      #
      #   @param top_k [Integer] Search for `top_k` nearest neighbors.
      #
      #   @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
