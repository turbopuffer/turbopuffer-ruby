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

      # @!attribute source_namespace
      #   The namespace to copy documents from.
      #
      #   @return [String]
      required :source_namespace, String

      # @!attribute source_api_key
      #   (Optional) An API key for the organization containing the source namespace
      #
      #   @return [String, nil]
      optional :source_api_key, String

      # @!attribute source_region
      #   (Optional) The region of the source namespace.
      #
      #   @return [String, nil]
      optional :source_region, String

      # @!method initialize(source_namespace:, namespace: nil, source_api_key: nil, source_region: nil, request_options: {})
      #   @param source_namespace [String] The namespace to copy documents from.
      #
      #   @param namespace [String]
      #
      #   @param source_api_key [String] (Optional) An API key for the organization containing the source namespace
      #
      #   @param source_region [String] (Optional) The region of the source namespace.
      #
      #   @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
