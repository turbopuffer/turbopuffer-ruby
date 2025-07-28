# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#metadata
    class NamespaceMetadata < Turbopuffer::Internal::Type::BaseModel
      # @!attribute approx_logical_bytes
      #   The approximate number of logical bytes in the namespace.
      #
      #   @return [Integer]
      required :approx_logical_bytes, Integer

      # @!attribute approx_row_count
      #   The approximate number of rows in the namespace.
      #
      #   @return [Integer]
      required :approx_row_count, Integer

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

      # @!method initialize(approx_logical_bytes:, approx_row_count:, created_at:, schema:)
      #   Metadata about a namespace.
      #
      #   @param approx_logical_bytes [Integer] The approximate number of logical bytes in the namespace.
      #
      #   @param approx_row_count [Integer] The approximate number of rows in the namespace.
      #
      #   @param created_at [Time] The timestamp when the namespace was created.
      #
      #   @param schema [Hash{Symbol=>Turbopuffer::Models::AttributeSchemaConfig}] The schema of the namespace.
    end
  end
end
