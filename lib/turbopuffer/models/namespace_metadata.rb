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
      #   Indicates that the namespace is encrypted with a customer-managed encryption key
      #   (CMEK).
      #
      #   @return [Turbopuffer::Models::NamespaceMetadata::Encryption::Sse, Turbopuffer::Models::NamespaceMetadata::Encryption::Cmek]
      required :encryption, union: -> { Turbopuffer::NamespaceMetadata::Encryption }

      # @!attribute index
      #
      #   @return [Turbopuffer::Models::NamespaceMetadata::Index::Status, Turbopuffer::Models::NamespaceMetadata::Index::UnionMember1]
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

      # @!method initialize(approx_logical_bytes:, approx_row_count:, created_at:, encryption:, index:, schema:, updated_at:)
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
      #   @param encryption [Turbopuffer::Models::NamespaceMetadata::Encryption::Sse, Turbopuffer::Models::NamespaceMetadata::Encryption::Cmek] Indicates that the namespace is encrypted with a customer-managed encryption key
      #
      #   @param index [Turbopuffer::Models::NamespaceMetadata::Index::Status, Turbopuffer::Models::NamespaceMetadata::Index::UnionMember1]
      #
      #   @param schema [Hash{Symbol=>Turbopuffer::Models::AttributeSchemaConfig}] The schema of the namespace.
      #
      #   @param updated_at [Time] The timestamp when the namespace was last modified by a write operation.

      # Indicates that the namespace is encrypted with a customer-managed encryption key
      # (CMEK).
      #
      # @see Turbopuffer::Models::NamespaceMetadata#encryption
      module Encryption
        extend Turbopuffer::Internal::Type::Union

        variant -> { Turbopuffer::NamespaceMetadata::Encryption::Sse }

        # Indicates that the namespace is encrypted with a customer-managed encryption key (CMEK).
        variant -> { Turbopuffer::NamespaceMetadata::Encryption::Cmek }

        class Sse < Turbopuffer::Internal::Type::BaseModel
          # @!attribute sse
          #   Always true. Indicates that the namespace is encrypted with SSE.
          #
          #   @return [Boolean]
          required :sse, Turbopuffer::Internal::Type::Boolean

          # @!method initialize(sse:)
          #   @param sse [Boolean] Always true. Indicates that the namespace is encrypted with SSE.
        end

        class Cmek < Turbopuffer::Internal::Type::BaseModel
          # @!attribute cmek
          #
          #   @return [Turbopuffer::Models::NamespaceMetadata::Encryption::Cmek::Cmek]
          required :cmek, -> { Turbopuffer::NamespaceMetadata::Encryption::Cmek::Cmek }

          # @!method initialize(cmek:)
          #   Indicates that the namespace is encrypted with a customer-managed encryption key
          #   (CMEK).
          #
          #   @param cmek [Turbopuffer::Models::NamespaceMetadata::Encryption::Cmek::Cmek]

          # @see Turbopuffer::Models::NamespaceMetadata::Encryption::Cmek#cmek
          class Cmek < Turbopuffer::Internal::Type::BaseModel
            # @!attribute key_name
            #   The name of the CMEK key in use.
            #
            #   @return [String]
            required :key_name, String

            # @!method initialize(key_name:)
            #   @param key_name [String] The name of the CMEK key in use.
          end
        end

        # @!method self.variants
        #   @return [Array(Turbopuffer::Models::NamespaceMetadata::Encryption::Sse, Turbopuffer::Models::NamespaceMetadata::Encryption::Cmek)]
      end

      # @see Turbopuffer::Models::NamespaceMetadata#index
      module Index
        extend Turbopuffer::Internal::Type::Union

        variant -> { Turbopuffer::NamespaceMetadata::Index::Status }

        variant -> { Turbopuffer::NamespaceMetadata::Index::UnionMember1 }

        class Status < Turbopuffer::Internal::Type::BaseModel
          # @!attribute status
          #
          #   @return [Symbol, :"up-to-date"]
          required :status, const: :"up-to-date"

          # @!method initialize(status: :"up-to-date")
          #   @param status [Symbol, :"up-to-date"]
        end

        class UnionMember1 < Turbopuffer::Internal::Type::BaseModel
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
          #   {Turbopuffer::Models::NamespaceMetadata::Index::UnionMember1} for more details.
          #
          #   @param unindexed_bytes [Integer] The number of bytes in the namespace that are in the write-ahead log but have no
          #
          #   @param status [Symbol, :updating]
        end

        # @!method self.variants
        #   @return [Array(Turbopuffer::Models::NamespaceMetadata::Index::Status, Turbopuffer::Models::NamespaceMetadata::Index::UnionMember1)]
      end
    end
  end
end
