# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#copy_from
    class NamespaceCopyFromParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      # @!attribute namespace
      #
      #   @return [String, nil]
      optional :namespace, String

      # @!attribute copy_from_namespace
      #   The namespace to copy documents from.
      #
      #   @return [String, Turbopuffer::Models::CopyFromNamespaceParams::CopyFromNamespaceConfig]
      required :copy_from_namespace, union: -> { Turbopuffer::CopyFromNamespaceParams }

      # @!method initialize(copy_from_namespace:, namespace: nil, request_options: {})
      #   @param copy_from_namespace [String, Turbopuffer::Models::CopyFromNamespaceParams::CopyFromNamespaceConfig] The namespace to copy documents from.
      #
      #   @param namespace [String]
      #
      #   @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
