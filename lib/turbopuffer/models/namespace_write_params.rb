# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#write
    class NamespaceWriteParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      # @!attribute namespace
      #
      #   @return [String]
      required :namespace, String

      # @!attribute copy_from_namespace
      #   The namespace to copy documents from.
      #
      #   @return [String, nil]
      optional :copy_from_namespace, String

      # @!attribute delete_by_filter
      #   The filter specifying which documents to delete.
      #
      #   @return [Object, nil]
      optional :delete_by_filter, Turbopuffer::Internal::Type::Unknown

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

      # @!method initialize(namespace:, copy_from_namespace: nil, delete_by_filter: nil, delete_condition: nil, deletes: nil, distance_metric: nil, encryption: nil, patch_columns: nil, patch_condition: nil, patch_rows: nil, schema: nil, upsert_columns: nil, upsert_condition: nil, upsert_rows: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::NamespaceWriteParams} for more details.
      #
      #   @param namespace [String]
      #
      #   @param copy_from_namespace [String] The namespace to copy documents from.
      #
      #   @param delete_by_filter [Object] The filter specifying which documents to delete.
      #
      #   @param delete_condition [Object] A condition evaluated against the current value of each document targeted by a d
      #
      #   @param deletes [Array<String, Integer>]
      #
      #   @param distance_metric [Symbol, Turbopuffer::Models::DistanceMetric] A function used to calculate vector similarity.
      #
      #   @param encryption [Turbopuffer::Models::NamespaceWriteParams::Encryption] The encryption configuration for a namespace.
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
    end
  end
end
