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

      # @!attribute encryption
      #   The encryption configuration for a namespace.
      #
      #   @return [Turbopuffer::Models::Encryption::CustomerManaged, Turbopuffer::Models::Encryption::Default]
      required :encryption, union: -> { Turbopuffer::Encryption }

      # @!attribute index
      #
      #   @return [Turbopuffer::Models::NamespaceMetadata::Index::IndexUpToDate, Turbopuffer::Models::NamespaceMetadata::Index::IndexUpdating]
      required :index, union: -> { Turbopuffer::NamespaceMetadata::Index }

      # @!attribute schema
      #   The schema of the namespace.
      #
      #   @return [Hash{Symbol=>Turbopuffer::Models::AttributeSchemaConfig}]
      required :schema, -> { Turbopuffer::Internal::Type::HashOf[Turbopuffer::AttributeSchemaConfig] }

      # @!attribute updated_at
      #   The timestamp when the namespace was last modified by a write operation.
      #
      #   @return [Time]
      required :updated_at, Time

      # @!attribute pinning
      #   Configuration for namespace pinning, along with the current status of the pinned
      #   namespace.
      #
      #   @return [Turbopuffer::Models::NamespaceMetadata::Pinning, nil]
      optional :pinning, -> { Turbopuffer::NamespaceMetadata::Pinning }

      # @!method initialize(approx_logical_bytes:, approx_row_count:, created_at:, encryption:, index:, schema:, updated_at:, pinning: nil)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::NamespaceMetadata} for more details.
      #
      #   Metadata about a namespace.
      #
      #   @param approx_logical_bytes [Integer] The approximate number of logical bytes in the namespace.
      #
      #   @param approx_row_count [Integer] The approximate number of rows in the namespace.
      #
      #   @param created_at [Time] The timestamp when the namespace was created.
      #
      #   @param encryption [Turbopuffer::Models::Encryption::CustomerManaged, Turbopuffer::Models::Encryption::Default] The encryption configuration for a namespace.
      #
      #   @param index [Turbopuffer::Models::NamespaceMetadata::Index::IndexUpToDate, Turbopuffer::Models::NamespaceMetadata::Index::IndexUpdating]
      #
      #   @param schema [Hash{Symbol=>Turbopuffer::Models::AttributeSchemaConfig}] The schema of the namespace.
      #
      #   @param updated_at [Time] The timestamp when the namespace was last modified by a write operation.
      #
      #   @param pinning [Turbopuffer::Models::NamespaceMetadata::Pinning] Configuration for namespace pinning, along with the current status of the pinned

      # @see Turbopuffer::Models::NamespaceMetadata#index
      module Index
        extend Turbopuffer::Internal::Type::Union

        variant -> { Turbopuffer::NamespaceMetadata::Index::IndexUpToDate }

        variant -> { Turbopuffer::NamespaceMetadata::Index::IndexUpdating }

        class IndexUpToDate < Turbopuffer::Internal::Type::BaseModel
          # @!attribute status
          #
          #   @return [Symbol, :"up-to-date"]
          required :status, const: :"up-to-date"

          # @!method initialize(status: :"up-to-date")
          #   @param status [Symbol, :"up-to-date"]
        end

        class IndexUpdating < Turbopuffer::Internal::Type::BaseModel
          # @!attribute status
          #
          #   @return [Symbol, :updating]
          required :status, const: :updating

          # @!attribute unindexed_bytes
          #   The number of bytes in the namespace that are in the write-ahead log but have
          #   not yet been indexed.
          #
          #   @return [Integer]
          required :unindexed_bytes, Integer

          # @!method initialize(unindexed_bytes:, status: :updating)
          #   Some parameter documentations has been truncated, see
          #   {Turbopuffer::Models::NamespaceMetadata::Index::IndexUpdating} for more details.
          #
          #   @param unindexed_bytes [Integer] The number of bytes in the namespace that are in the write-ahead log but have no
          #
          #   @param status [Symbol, :updating]
        end

        # @!method self.variants
        #   @return [Array(Turbopuffer::Models::NamespaceMetadata::Index::IndexUpToDate, Turbopuffer::Models::NamespaceMetadata::Index::IndexUpdating)]
      end

      # @see Turbopuffer::Models::NamespaceMetadata#pinning
      class Pinning < Turbopuffer::Models::PinningConfig
        # @!attribute status
        #   Operational status for a pinned namespace.
        #
        #   @return [Turbopuffer::Models::NamespaceMetadata::Pinning::Status, nil]
        optional :status, -> { Turbopuffer::NamespaceMetadata::Pinning::Status }

        # @!method initialize(status: nil)
        #   Configuration for namespace pinning, along with the current status of the pinned
        #   namespace.
        #
        #   @param status [Turbopuffer::Models::NamespaceMetadata::Pinning::Status] Operational status for a pinned namespace.

        class Status < Turbopuffer::Internal::Type::BaseModel
          # @!attribute ready_replicas
          #   The number of replicas that are warm and serving traffic.
          #
          #   @return [Integer]
          required :ready_replicas, Integer

          # @!attribute updated_at
          #   The timestamp of the latest pinning status snapshot.
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute utilization
          #   Aggregate utilization for the pinned namespace, reported as a value between 0.0
          #   and 1.0.
          #
          #   @return [Float]
          required :utilization, Float

          # @!method initialize(ready_replicas:, updated_at:, utilization:)
          #   Some parameter documentations has been truncated, see
          #   {Turbopuffer::Models::NamespaceMetadata::Pinning::Status} for more details.
          #
          #   Operational status for a pinned namespace.
          #
          #   @param ready_replicas [Integer] The number of replicas that are warm and serving traffic.
          #
          #   @param updated_at [Time] The timestamp of the latest pinning status snapshot.
          #
          #   @param utilization [Float] Aggregate utilization for the pinned namespace, reported as a value between 0.0
        end
      end
    end
  end
end
