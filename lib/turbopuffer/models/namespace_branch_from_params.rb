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

      # @!attribute source_namespace
      #   The namespace to create an instant, copy-on-write clone of.
      #
      #   @return [String]
      required :source_namespace, String

      # @!method initialize(source_namespace:, namespace: nil, request_options: {})
      #   @param source_namespace [String] The namespace to create an instant, copy-on-write clone of.
      #
      #   @param namespace [String]
      #
      #   @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
