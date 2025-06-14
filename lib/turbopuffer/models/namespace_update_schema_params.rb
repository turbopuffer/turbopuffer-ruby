# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#update_schema
    class NamespaceUpdateSchemaParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      # @!attribute namespace
      #
      #   @return [String]
      required :namespace, String

      # @!attribute schema
      #   The desired schema for the namespace.
      #
      #   @return [Hash{Symbol=>String, Turbopuffer::Models::AttributeSchemaConfig}, nil]
      optional :schema, -> { Turbopuffer::Internal::Type::HashOf[union: Turbopuffer::AttributeSchema] }

      # @!method initialize(namespace:, schema: nil, request_options: {})
      #   @param namespace [String]
      #
      #   @param schema [Hash{Symbol=>String, Turbopuffer::Models::AttributeSchemaConfig}] The desired schema for the namespace.
      #
      #   @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
