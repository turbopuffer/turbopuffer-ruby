# typed: strong

module Turbopuffer
  module Models
    class NamespaceMetadata < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::NamespaceMetadata, Turbopuffer::Internal::AnyHash)
        end

      # The approximate number of logical bytes in the namespace.
      sig { returns(Integer) }
      attr_accessor :approx_logical_bytes

      # The approximate number of rows in the namespace.
      sig { returns(Integer) }
      attr_accessor :approx_row_count

      # The timestamp when the namespace was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # Indicates that the namespace is encrypted with a customer-managed encryption key
      # (CMEK).
      sig { returns(Turbopuffer::NamespaceMetadata::Encryption::Variants) }
      attr_accessor :encryption

      sig { returns(Turbopuffer::NamespaceMetadata::Index::Variants) }
      attr_accessor :index

      # The schema of the namespace.
      sig { returns(T::Hash[Symbol, Turbopuffer::AttributeSchemaConfig]) }
      attr_accessor :schema

      # The timestamp when the namespace was last modified by a write operation.
      sig { returns(Time) }
      attr_accessor :updated_at

      # Configuration for namespace pinning, along with the current status of the pinned
      # namespace.
      sig { returns(T.nilable(Turbopuffer::NamespaceMetadata::Pinning)) }
      attr_reader :pinning

      sig do
        params(pinning: Turbopuffer::NamespaceMetadata::Pinning::OrHash).void
      end
      attr_writer :pinning

      # Metadata about a namespace.
      sig do
        params(
          approx_logical_bytes: Integer,
          approx_row_count: Integer,
          created_at: Time,
          encryption:
            T.any(
              Turbopuffer::NamespaceMetadata::Encryption::Sse::OrHash,
              Turbopuffer::NamespaceMetadata::Encryption::Cmek::OrHash
            ),
          index:
            T.any(
              Turbopuffer::NamespaceMetadata::Index::IndexUpToDate::OrHash,
              Turbopuffer::NamespaceMetadata::Index::IndexUpdating::OrHash
            ),
          schema: T::Hash[Symbol, Turbopuffer::AttributeSchemaConfig::OrHash],
          updated_at: Time,
          pinning: Turbopuffer::NamespaceMetadata::Pinning::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The approximate number of logical bytes in the namespace.
        approx_logical_bytes:,
        # The approximate number of rows in the namespace.
        approx_row_count:,
        # The timestamp when the namespace was created.
        created_at:,
        # Indicates that the namespace is encrypted with a customer-managed encryption key
        # (CMEK).
        encryption:,
        index:,
        # The schema of the namespace.
        schema:,
        # The timestamp when the namespace was last modified by a write operation.
        updated_at:,
        # Configuration for namespace pinning, along with the current status of the pinned
        # namespace.
        pinning: nil
      )
      end

      sig do
        override.returns(
          {
            approx_logical_bytes: Integer,
            approx_row_count: Integer,
            created_at: Time,
            encryption: Turbopuffer::NamespaceMetadata::Encryption::Variants,
            index: Turbopuffer::NamespaceMetadata::Index::Variants,
            schema: T::Hash[Symbol, Turbopuffer::AttributeSchemaConfig],
            updated_at: Time,
            pinning: Turbopuffer::NamespaceMetadata::Pinning
          }
        )
      end
      def to_hash
      end

      # Indicates that the namespace is encrypted with a customer-managed encryption key
      # (CMEK).
      module Encryption
        extend Turbopuffer::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Turbopuffer::NamespaceMetadata::Encryption::Sse,
              Turbopuffer::NamespaceMetadata::Encryption::Cmek
            )
          end

        class Sse < Turbopuffer::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Turbopuffer::NamespaceMetadata::Encryption::Sse,
                Turbopuffer::Internal::AnyHash
              )
            end

          # Always true. Indicates that the namespace is encrypted with SSE.
          sig { returns(T::Boolean) }
          attr_accessor :sse

          sig { params(sse: T::Boolean).returns(T.attached_class) }
          def self.new(
            # Always true. Indicates that the namespace is encrypted with SSE.
            sse:
          )
          end

          sig { override.returns({ sse: T::Boolean }) }
          def to_hash
          end
        end

        class Cmek < Turbopuffer::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Turbopuffer::NamespaceMetadata::Encryption::Cmek,
                Turbopuffer::Internal::AnyHash
              )
            end

          sig do
            returns(Turbopuffer::NamespaceMetadata::Encryption::Cmek::Cmek)
          end
          attr_reader :cmek

          sig do
            params(
              cmek:
                Turbopuffer::NamespaceMetadata::Encryption::Cmek::Cmek::OrHash
            ).void
          end
          attr_writer :cmek

          # Indicates that the namespace is encrypted with a customer-managed encryption key
          # (CMEK).
          sig do
            params(
              cmek:
                Turbopuffer::NamespaceMetadata::Encryption::Cmek::Cmek::OrHash
            ).returns(T.attached_class)
          end
          def self.new(cmek:)
          end

          sig do
            override.returns(
              { cmek: Turbopuffer::NamespaceMetadata::Encryption::Cmek::Cmek }
            )
          end
          def to_hash
          end

          class Cmek < Turbopuffer::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Turbopuffer::NamespaceMetadata::Encryption::Cmek::Cmek,
                  Turbopuffer::Internal::AnyHash
                )
              end

            # The name of the CMEK key in use.
            sig { returns(String) }
            attr_accessor :key_name

            sig { params(key_name: String).returns(T.attached_class) }
            def self.new(
              # The name of the CMEK key in use.
              key_name:
            )
            end

            sig { override.returns({ key_name: String }) }
            def to_hash
            end
          end
        end

        sig do
          override.returns(
            T::Array[Turbopuffer::NamespaceMetadata::Encryption::Variants]
          )
        end
        def self.variants
        end
      end

      module Index
        extend Turbopuffer::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Turbopuffer::NamespaceMetadata::Index::IndexUpToDate,
              Turbopuffer::NamespaceMetadata::Index::IndexUpdating
            )
          end

        class IndexUpToDate < Turbopuffer::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Turbopuffer::NamespaceMetadata::Index::IndexUpToDate,
                Turbopuffer::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :status

          sig { params(status: Symbol).returns(T.attached_class) }
          def self.new(status: :"up-to-date")
          end

          sig { override.returns({ status: Symbol }) }
          def to_hash
          end
        end

        class IndexUpdating < Turbopuffer::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Turbopuffer::NamespaceMetadata::Index::IndexUpdating,
                Turbopuffer::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :status

          # The number of bytes in the namespace that are in the write-ahead log but have
          # not yet been indexed.
          sig { returns(Integer) }
          attr_accessor :unindexed_bytes

          sig do
            params(unindexed_bytes: Integer, status: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The number of bytes in the namespace that are in the write-ahead log but have
            # not yet been indexed.
            unindexed_bytes:,
            status: :updating
          )
          end

          sig { override.returns({ status: Symbol, unindexed_bytes: Integer }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Turbopuffer::NamespaceMetadata::Index::Variants]
          )
        end
        def self.variants
        end
      end

      class Pinning < Turbopuffer::Models::PinningConfig
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::NamespaceMetadata::Pinning,
              Turbopuffer::Internal::AnyHash
            )
          end

        # Operational status for a pinned namespace.
        sig do
          returns(T.nilable(Turbopuffer::NamespaceMetadata::Pinning::Status))
        end
        attr_reader :status

        sig do
          params(
            status: Turbopuffer::NamespaceMetadata::Pinning::Status::OrHash
          ).void
        end
        attr_writer :status

        # Configuration for namespace pinning, along with the current status of the pinned
        # namespace.
        sig do
          params(
            status: Turbopuffer::NamespaceMetadata::Pinning::Status::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Operational status for a pinned namespace.
          status: nil
        )
        end

        sig do
          override.returns(
            { status: Turbopuffer::NamespaceMetadata::Pinning::Status }
          )
        end
        def to_hash
        end

        class Status < Turbopuffer::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Turbopuffer::NamespaceMetadata::Pinning::Status,
                Turbopuffer::Internal::AnyHash
              )
            end

          # The number of replicas that are warm and serving traffic.
          sig { returns(Integer) }
          attr_accessor :ready_replicas

          # The timestamp of the latest pinning status snapshot.
          sig { returns(Time) }
          attr_accessor :updated_at

          # Aggregate utilization for the pinned namespace, reported as a value between 0.0
          # and 1.0.
          sig { returns(Float) }
          attr_accessor :utilization

          # Operational status for a pinned namespace.
          sig do
            params(
              ready_replicas: Integer,
              updated_at: Time,
              utilization: Float
            ).returns(T.attached_class)
          end
          def self.new(
            # The number of replicas that are warm and serving traffic.
            ready_replicas:,
            # The timestamp of the latest pinning status snapshot.
            updated_at:,
            # Aggregate utilization for the pinned namespace, reported as a value between 0.0
            # and 1.0.
            utilization:
          )
          end

          sig do
            override.returns(
              { ready_replicas: Integer, updated_at: Time, utilization: Float }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
