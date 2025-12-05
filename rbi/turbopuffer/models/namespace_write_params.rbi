# typed: strong

module Turbopuffer
  module Models
    class NamespaceWriteParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::NamespaceWriteParams,
            Turbopuffer::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :namespace

      sig { params(namespace: String).void }
      attr_writer :namespace

      # The namespace to copy documents from.
      sig do
        returns(
          T.nilable(
            T.any(
              String,
              Turbopuffer::NamespaceWriteParams::CopyFromNamespace::CopyFromNamespaceConfig
            )
          )
        )
      end
      attr_reader :copy_from_namespace

      sig do
        params(
          copy_from_namespace:
            T.any(
              String,
              Turbopuffer::NamespaceWriteParams::CopyFromNamespace::CopyFromNamespaceConfig::OrHash
            )
        ).void
      end
      attr_writer :copy_from_namespace

      # The filter specifying which documents to delete.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :delete_by_filter

      sig { params(delete_by_filter: T.anything).void }
      attr_writer :delete_by_filter

      # Allow partial completion when filter matches too many documents.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :delete_by_filter_allow_partial

      sig { params(delete_by_filter_allow_partial: T::Boolean).void }
      attr_writer :delete_by_filter_allow_partial

      # A condition evaluated against the current value of each document targeted by a
      # delete write. Only documents that pass the condition are deleted.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :delete_condition

      sig { params(delete_condition: T.anything).void }
      attr_writer :delete_condition

      sig { returns(T.nilable(T::Array[Turbopuffer::ID::Variants])) }
      attr_reader :deletes

      sig { params(deletes: T::Array[Turbopuffer::ID::Variants]).void }
      attr_writer :deletes

      # Disables write throttling (HTTP 429 responses) during high-volume ingestion.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :disable_backpressure

      sig { params(disable_backpressure: T::Boolean).void }
      attr_writer :disable_backpressure

      # A function used to calculate vector similarity.
      sig { returns(T.nilable(Turbopuffer::DistanceMetric::OrSymbol)) }
      attr_reader :distance_metric

      sig do
        params(distance_metric: Turbopuffer::DistanceMetric::OrSymbol).void
      end
      attr_writer :distance_metric

      # The encryption configuration for a namespace.
      sig { returns(T.nilable(Turbopuffer::NamespaceWriteParams::Encryption)) }
      attr_reader :encryption

      sig do
        params(
          encryption: Turbopuffer::NamespaceWriteParams::Encryption::OrHash
        ).void
      end
      attr_writer :encryption

      # The patch and filter specifying which documents to patch.
      sig do
        returns(T.nilable(Turbopuffer::NamespaceWriteParams::PatchByFilter))
      end
      attr_reader :patch_by_filter

      sig do
        params(
          patch_by_filter:
            Turbopuffer::NamespaceWriteParams::PatchByFilter::OrHash
        ).void
      end
      attr_writer :patch_by_filter

      # Allow partial completion when filter matches too many documents.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :patch_by_filter_allow_partial

      sig { params(patch_by_filter_allow_partial: T::Boolean).void }
      attr_writer :patch_by_filter_allow_partial

      # A list of documents in columnar format. Each key is a column name, mapped to an
      # array of values for that column.
      sig { returns(T.nilable(Turbopuffer::Columns)) }
      attr_reader :patch_columns

      sig { params(patch_columns: Turbopuffer::Columns::OrHash).void }
      attr_writer :patch_columns

      # A condition evaluated against the current value of each document targeted by a
      # patch write. Only documents that pass the condition are patched.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :patch_condition

      sig { params(patch_condition: T.anything).void }
      attr_writer :patch_condition

      sig { returns(T.nilable(T::Array[Turbopuffer::Row])) }
      attr_reader :patch_rows

      sig { params(patch_rows: T::Array[Turbopuffer::Row::OrHash]).void }
      attr_writer :patch_rows

      # The schema of the attributes attached to the documents.
      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T.any(String, Turbopuffer::AttributeSchemaConfig)]
          )
        )
      end
      attr_reader :schema

      sig do
        params(
          schema:
            T::Hash[
              Symbol,
              T.any(String, Turbopuffer::AttributeSchemaConfig::OrHash)
            ]
        ).void
      end
      attr_writer :schema

      # A list of documents in columnar format. Each key is a column name, mapped to an
      # array of values for that column.
      sig { returns(T.nilable(Turbopuffer::Columns)) }
      attr_reader :upsert_columns

      sig { params(upsert_columns: Turbopuffer::Columns::OrHash).void }
      attr_writer :upsert_columns

      # A condition evaluated against the current value of each document targeted by an
      # upsert write. Only documents that pass the condition are upserted.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :upsert_condition

      sig { params(upsert_condition: T.anything).void }
      attr_writer :upsert_condition

      sig { returns(T.nilable(T::Array[Turbopuffer::Row])) }
      attr_reader :upsert_rows

      sig { params(upsert_rows: T::Array[Turbopuffer::Row::OrHash]).void }
      attr_writer :upsert_rows

      sig do
        params(
          namespace: String,
          copy_from_namespace:
            T.any(
              String,
              Turbopuffer::NamespaceWriteParams::CopyFromNamespace::CopyFromNamespaceConfig::OrHash
            ),
          delete_by_filter: T.anything,
          delete_by_filter_allow_partial: T::Boolean,
          delete_condition: T.anything,
          deletes: T::Array[Turbopuffer::ID::Variants],
          disable_backpressure: T::Boolean,
          distance_metric: Turbopuffer::DistanceMetric::OrSymbol,
          encryption: Turbopuffer::NamespaceWriteParams::Encryption::OrHash,
          patch_by_filter:
            Turbopuffer::NamespaceWriteParams::PatchByFilter::OrHash,
          patch_by_filter_allow_partial: T::Boolean,
          patch_columns: Turbopuffer::Columns::OrHash,
          patch_condition: T.anything,
          patch_rows: T::Array[Turbopuffer::Row::OrHash],
          schema:
            T::Hash[
              Symbol,
              T.any(String, Turbopuffer::AttributeSchemaConfig::OrHash)
            ],
          upsert_columns: Turbopuffer::Columns::OrHash,
          upsert_condition: T.anything,
          upsert_rows: T::Array[Turbopuffer::Row::OrHash],
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        namespace: nil,
        # The namespace to copy documents from.
        copy_from_namespace: nil,
        # The filter specifying which documents to delete.
        delete_by_filter: nil,
        # Allow partial completion when filter matches too many documents.
        delete_by_filter_allow_partial: nil,
        # A condition evaluated against the current value of each document targeted by a
        # delete write. Only documents that pass the condition are deleted.
        delete_condition: nil,
        deletes: nil,
        # Disables write throttling (HTTP 429 responses) during high-volume ingestion.
        disable_backpressure: nil,
        # A function used to calculate vector similarity.
        distance_metric: nil,
        # The encryption configuration for a namespace.
        encryption: nil,
        # The patch and filter specifying which documents to patch.
        patch_by_filter: nil,
        # Allow partial completion when filter matches too many documents.
        patch_by_filter_allow_partial: nil,
        # A list of documents in columnar format. Each key is a column name, mapped to an
        # array of values for that column.
        patch_columns: nil,
        # A condition evaluated against the current value of each document targeted by a
        # patch write. Only documents that pass the condition are patched.
        patch_condition: nil,
        patch_rows: nil,
        # The schema of the attributes attached to the documents.
        schema: nil,
        # A list of documents in columnar format. Each key is a column name, mapped to an
        # array of values for that column.
        upsert_columns: nil,
        # A condition evaluated against the current value of each document targeted by an
        # upsert write. Only documents that pass the condition are upserted.
        upsert_condition: nil,
        upsert_rows: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            namespace: String,
            copy_from_namespace:
              T.any(
                String,
                Turbopuffer::NamespaceWriteParams::CopyFromNamespace::CopyFromNamespaceConfig
              ),
            delete_by_filter: T.anything,
            delete_by_filter_allow_partial: T::Boolean,
            delete_condition: T.anything,
            deletes: T::Array[Turbopuffer::ID::Variants],
            disable_backpressure: T::Boolean,
            distance_metric: Turbopuffer::DistanceMetric::OrSymbol,
            encryption: Turbopuffer::NamespaceWriteParams::Encryption,
            patch_by_filter: Turbopuffer::NamespaceWriteParams::PatchByFilter,
            patch_by_filter_allow_partial: T::Boolean,
            patch_columns: Turbopuffer::Columns,
            patch_condition: T.anything,
            patch_rows: T::Array[Turbopuffer::Row],
            schema:
              T::Hash[
                Symbol,
                T.any(String, Turbopuffer::AttributeSchemaConfig)
              ],
            upsert_columns: Turbopuffer::Columns,
            upsert_condition: T.anything,
            upsert_rows: T::Array[Turbopuffer::Row],
            request_options: Turbopuffer::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The namespace to copy documents from.
      module CopyFromNamespace
        extend Turbopuffer::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              String,
              Turbopuffer::NamespaceWriteParams::CopyFromNamespace::CopyFromNamespaceConfig
            )
          end

        class CopyFromNamespaceConfig < Turbopuffer::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Turbopuffer::NamespaceWriteParams::CopyFromNamespace::CopyFromNamespaceConfig,
                Turbopuffer::Internal::AnyHash
              )
            end

          # The namespace to copy documents from.
          sig { returns(String) }
          attr_accessor :source_namespace

          # An API key for the organization containing the source namespace
          sig { returns(T.nilable(String)) }
          attr_reader :source_api_key

          sig { params(source_api_key: String).void }
          attr_writer :source_api_key

          # The region of the source namespace.
          sig { returns(T.nilable(String)) }
          attr_reader :source_region

          sig { params(source_region: String).void }
          attr_writer :source_region

          sig do
            params(
              source_namespace: String,
              source_api_key: String,
              source_region: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The namespace to copy documents from.
            source_namespace:,
            # An API key for the organization containing the source namespace
            source_api_key: nil,
            # The region of the source namespace.
            source_region: nil
          )
          end

          sig do
            override.returns(
              {
                source_namespace: String,
                source_api_key: String,
                source_region: String
              }
            )
          end
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[
              Turbopuffer::NamespaceWriteParams::CopyFromNamespace::Variants
            ]
          )
        end
        def self.variants
        end
      end

      class Encryption < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::NamespaceWriteParams::Encryption,
              Turbopuffer::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(Turbopuffer::NamespaceWriteParams::Encryption::Cmek)
          )
        end
        attr_reader :cmek

        sig do
          params(
            cmek: Turbopuffer::NamespaceWriteParams::Encryption::Cmek::OrHash
          ).void
        end
        attr_writer :cmek

        # The encryption configuration for a namespace.
        sig do
          params(
            cmek: Turbopuffer::NamespaceWriteParams::Encryption::Cmek::OrHash
          ).returns(T.attached_class)
        end
        def self.new(cmek: nil)
        end

        sig do
          override.returns(
            { cmek: Turbopuffer::NamespaceWriteParams::Encryption::Cmek }
          )
        end
        def to_hash
        end

        class Cmek < Turbopuffer::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Turbopuffer::NamespaceWriteParams::Encryption::Cmek,
                Turbopuffer::Internal::AnyHash
              )
            end

          # The identifier of the CMEK key to use for encryption. For GCP, the
          # fully-qualified resource name of the key. For AWS, the ARN of the key.
          sig { returns(String) }
          attr_accessor :key_name

          sig { params(key_name: String).returns(T.attached_class) }
          def self.new(
            # The identifier of the CMEK key to use for encryption. For GCP, the
            # fully-qualified resource name of the key. For AWS, the ARN of the key.
            key_name:
          )
          end

          sig { override.returns({ key_name: String }) }
          def to_hash
          end
        end
      end

      class PatchByFilter < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::NamespaceWriteParams::PatchByFilter,
              Turbopuffer::Internal::AnyHash
            )
          end

        # Filter by attributes. Same syntax as the query endpoint.
        sig { returns(T.anything) }
        attr_accessor :filters

        sig { returns(T::Hash[Symbol, T.anything]) }
        attr_accessor :patch

        # The patch and filter specifying which documents to patch.
        sig do
          params(
            filters: T.anything,
            patch: T::Hash[Symbol, T.anything]
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter by attributes. Same syntax as the query endpoint.
          filters:,
          patch:
        )
        end

        sig do
          override.returns(
            { filters: T.anything, patch: T::Hash[Symbol, T.anything] }
          )
        end
        def to_hash
        end
      end
    end
  end
end
