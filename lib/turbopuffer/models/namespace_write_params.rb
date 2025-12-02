# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#write
    class NamespaceWriteParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      # @!attribute namespace
      #
      #   @return [String, nil]
      optional :namespace, String

      # @!attribute copy_from_namespace
      #   The namespace to copy documents from.
      #
      #   @return [String, Turbopuffer::Models::NamespaceWriteParams::CopyFromNamespace::CopyFromNamespaceConfig, nil]
      optional :copy_from_namespace, union: -> { Turbopuffer::NamespaceWriteParams::CopyFromNamespace }

      # @!attribute delete_by_filter
      #   The filter specifying which documents to delete.
      #
      #   @return [Object, nil]
      optional :delete_by_filter, Turbopuffer::Internal::Type::Unknown

      # @!attribute delete_by_filter_allow_partial
      #   Allow partial completion when filter matches too many documents.
      #
      #   @return [Boolean, nil]
      optional :delete_by_filter_allow_partial, Turbopuffer::Internal::Type::Boolean

      # @!attribute delete_condition
      #   A condition evaluated against the current value of each document targeted by a
      #   delete write. Only documents that pass the condition are deleted.
      #
      #   @return [Object, nil]
      optional :delete_condition, Turbopuffer::Internal::Type::Unknown

      # @!attribute deletes
      #
      #   @return [Array<String, Integer>, nil]
      optional :deletes, -> { Turbopuffer::Internal::Type::ArrayOf[union: Turbopuffer::ID] }

      # @!attribute disable_backpressure
      #   Disables write throttling (HTTP 429 responses) during high-volume ingestion.
      #
      #   @return [Boolean, nil]
      optional :disable_backpressure, Turbopuffer::Internal::Type::Boolean

      # @!attribute distance_metric
      #   A function used to calculate vector similarity.
      #
      #   @return [Symbol, Turbopuffer::Models::DistanceMetric, nil]
      optional :distance_metric, enum: -> { Turbopuffer::DistanceMetric }

      # @!attribute encryption
      #   The encryption configuration for a namespace.
      #
      #   @return [Turbopuffer::Models::NamespaceWriteParams::Encryption, nil]
      optional :encryption, -> { Turbopuffer::NamespaceWriteParams::Encryption }

      # @!attribute patch_by_filter
      #   The patch and filter specifying which documents to patch.
      #
      #   @return [Turbopuffer::Models::NamespaceWriteParams::PatchByFilter, nil]
      optional :patch_by_filter, -> { Turbopuffer::NamespaceWriteParams::PatchByFilter }

      # @!attribute patch_by_filter_allow_partial
      #   Allow partial completion when filter matches too many documents.
      #
      #   @return [Boolean, nil]
      optional :patch_by_filter_allow_partial, Turbopuffer::Internal::Type::Boolean

      # @!attribute patch_columns
      #   A list of documents in columnar format. Each key is a column name, mapped to an
      #   array of values for that column.
      #
      #   @return [Turbopuffer::Models::Columns, nil]
      optional :patch_columns, -> { Turbopuffer::Columns }

      # @!attribute patch_condition
      #   A condition evaluated against the current value of each document targeted by a
      #   patch write. Only documents that pass the condition are patched.
      #
      #   @return [Object, nil]
      optional :patch_condition, Turbopuffer::Internal::Type::Unknown

      # @!attribute patch_rows
      #
      #   @return [Array<Turbopuffer::Models::Row>, nil]
      optional :patch_rows, -> { Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Row] }

      # @!attribute schema
      #   The schema of the attributes attached to the documents.
      #
      #   @return [Hash{Symbol=>String, Turbopuffer::Models::AttributeSchemaConfig}, nil]
      optional :schema, -> { Turbopuffer::Internal::Type::HashOf[union: Turbopuffer::AttributeSchema] }

      # @!attribute upsert_columns
      #   A list of documents in columnar format. Each key is a column name, mapped to an
      #   array of values for that column.
      #
      #   @return [Turbopuffer::Models::Columns, nil]
      optional :upsert_columns, -> { Turbopuffer::Columns }

      # @!attribute upsert_condition
      #   A condition evaluated against the current value of each document targeted by an
      #   upsert write. Only documents that pass the condition are upserted.
      #
      #   @return [Object, nil]
      optional :upsert_condition, Turbopuffer::Internal::Type::Unknown

      # @!attribute upsert_rows
      #
      #   @return [Array<Turbopuffer::Models::Row>, nil]
      optional :upsert_rows, -> { Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Row] }

      # @!method initialize(namespace: nil, copy_from_namespace: nil, delete_by_filter: nil, delete_by_filter_allow_partial: nil, delete_condition: nil, deletes: nil, disable_backpressure: nil, distance_metric: nil, encryption: nil, patch_by_filter: nil, patch_by_filter_allow_partial: nil, patch_columns: nil, patch_condition: nil, patch_rows: nil, schema: nil, upsert_columns: nil, upsert_condition: nil, upsert_rows: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::NamespaceWriteParams} for more details.
      #
      #   @param namespace [String]
      #
      #   @param copy_from_namespace [String, Turbopuffer::Models::NamespaceWriteParams::CopyFromNamespace::CopyFromNamespaceConfig] The namespace to copy documents from.
      #
      #   @param delete_by_filter [Object] The filter specifying which documents to delete.
      #
      #   @param delete_by_filter_allow_partial [Boolean] Allow partial completion when filter matches too many documents.
      #
      #   @param delete_condition [Object] A condition evaluated against the current value of each document targeted by a d
      #
      #   @param deletes [Array<String, Integer>]
      #
      #   @param disable_backpressure [Boolean] Disables write throttling (HTTP 429 responses) during high-volume ingestion.
      #
      #   @param distance_metric [Symbol, Turbopuffer::Models::DistanceMetric] A function used to calculate vector similarity.
      #
      #   @param encryption [Turbopuffer::Models::NamespaceWriteParams::Encryption] The encryption configuration for a namespace.
      #
      #   @param patch_by_filter [Turbopuffer::Models::NamespaceWriteParams::PatchByFilter] The patch and filter specifying which documents to patch.
      #
      #   @param patch_by_filter_allow_partial [Boolean] Allow partial completion when filter matches too many documents.
      #
      #   @param patch_columns [Turbopuffer::Models::Columns] A list of documents in columnar format. Each key is a column name, mapped to an
      #
      #   @param patch_condition [Object] A condition evaluated against the current value of each document targeted by a p
      #
      #   @param patch_rows [Array<Turbopuffer::Models::Row>]
      #
      #   @param schema [Hash{Symbol=>String, Turbopuffer::Models::AttributeSchemaConfig}] The schema of the attributes attached to the documents.
      #
      #   @param upsert_columns [Turbopuffer::Models::Columns] A list of documents in columnar format. Each key is a column name, mapped to an
      #
      #   @param upsert_condition [Object] A condition evaluated against the current value of each document targeted by an
      #
      #   @param upsert_rows [Array<Turbopuffer::Models::Row>]
      #
      #   @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}]

      # The namespace to copy documents from.
      module CopyFromNamespace
        extend Turbopuffer::Internal::Type::Union

        # The namespace to copy documents from.
        variant String

        variant -> { Turbopuffer::NamespaceWriteParams::CopyFromNamespace::CopyFromNamespaceConfig }

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
        #   @return [Array(String, Turbopuffer::Models::NamespaceWriteParams::CopyFromNamespace::CopyFromNamespaceConfig)]
      end

      class Encryption < Turbopuffer::Internal::Type::BaseModel
        # @!attribute cmek
        #
        #   @return [Turbopuffer::Models::NamespaceWriteParams::Encryption::Cmek, nil]
        optional :cmek, -> { Turbopuffer::NamespaceWriteParams::Encryption::Cmek }

        # @!method initialize(cmek: nil)
        #   The encryption configuration for a namespace.
        #
        #   @param cmek [Turbopuffer::Models::NamespaceWriteParams::Encryption::Cmek]

        # @see Turbopuffer::Models::NamespaceWriteParams::Encryption#cmek
        class Cmek < Turbopuffer::Internal::Type::BaseModel
          # @!attribute key_name
          #   The identifier of the CMEK key to use for encryption. For GCP, the
          #   fully-qualified resource name of the key. For AWS, the ARN of the key.
          #
          #   @return [String]
          required :key_name, String

          # @!method initialize(key_name:)
          #   Some parameter documentations has been truncated, see
          #   {Turbopuffer::Models::NamespaceWriteParams::Encryption::Cmek} for more details.
          #
          #   @param key_name [String] The identifier of the CMEK key to use for encryption. For GCP, the fully-qualifi
        end
      end

      class PatchByFilter < Turbopuffer::Internal::Type::BaseModel
        # @!attribute filters
        #   Filter by attributes. Same syntax as the query endpoint.
        #
        #   @return [Object]
        required :filters, Turbopuffer::Internal::Type::Unknown

        # @!attribute patch
        #
        #   @return [Hash{Symbol=>Object}]
        required :patch, Turbopuffer::Internal::Type::HashOf[Turbopuffer::Internal::Type::Unknown]

        # @!method initialize(filters:, patch:)
        #   The patch and filter specifying which documents to patch.
        #
        #   @param filters [Object] Filter by attributes. Same syntax as the query endpoint.
        #
        #   @param patch [Hash{Symbol=>Object}]
      end
    end
  end
end
