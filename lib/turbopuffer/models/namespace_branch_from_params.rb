# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#branch_from
    class NamespaceBranchFromParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      # @!attribute namespace
      #
      #   @return [String, nil]
      optional :namespace, String

      # @!attribute branch_from_namespace
      #   The namespace to create an instant, copy-on-write clone of.
      #
      #   @return [String, Turbopuffer::Models::BranchFromNamespaceParams::BranchFromNamespaceConfig]
      required :branch_from_namespace, union: -> { Turbopuffer::BranchFromNamespaceParams }

      # @!method initialize(branch_from_namespace:, namespace: nil, request_options: {})
      #   @param branch_from_namespace [String, Turbopuffer::Models::BranchFromNamespaceParams::BranchFromNamespaceConfig] The namespace to create an instant, copy-on-write clone of.
      #
      #   @param namespace [String]
      #
      #   @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
