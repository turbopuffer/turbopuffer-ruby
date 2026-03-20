# frozen_string_literal: true

module Turbopuffer
  module Models
    # The namespace to copy documents from.
    module CopyFromNamespaceParams
      extend Turbopuffer::Internal::Type::Union

      # The namespace to copy documents from.
      variant String

      variant -> { Turbopuffer::CopyFromNamespaceParams::CopyFromNamespaceConfig }

      class CopyFromNamespaceConfig < Turbopuffer::Internal::Type::BaseModel
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

        # @!method initialize(source_namespace:, source_api_key: nil, source_region: nil)
        #   @param source_namespace [String] The namespace to copy documents from.
        #
        #   @param source_api_key [String] (Optional) An API key for the organization containing the source namespace
        #
        #   @param source_region [String] (Optional) The region of the source namespace.
      end

      # @!method self.variants
      #   @return [Array(String, Turbopuffer::Models::CopyFromNamespaceParams::CopyFromNamespaceConfig)]
    end
  end
end
