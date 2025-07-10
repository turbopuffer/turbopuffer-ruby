# frozen_string_literal: true

module Turbopuffer
  module Models
    class NamespaceMetadata < Turbopuffer::Internal::Type::BaseModel
      # @!attribute approx_logical_bytes
      #   The approximate number of logical bytes in the namespace.
      #
      #   @return [Integer]
      required :approx_logical_bytes, Integer

      # @!attribute created_at
      #   The timestamp when the namespace was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute schema
      #   The schema of the namespace.
      #
      #   @return [Hash{Symbol=>Turbopuffer::Models::AttributeSchemaConfig}]
      required :schema, -> { Turbopuffer::Internal::Type::HashOf[Turbopuffer::AttributeSchemaConfig] }

      # @!method initialize(approx_logical_bytes:, created_at:, schema:)
      #   Metadata about a namespace.
      #
      #   @param approx_logical_bytes [Integer] The approximate number of logical bytes in the namespace.
      #
      #   @param created_at [Time] The timestamp when the namespace was created.
      #
      #   @param schema [Hash{Symbol=>Turbopuffer::Models::AttributeSchemaConfig}] The schema of the namespace.
    end
  end
end
