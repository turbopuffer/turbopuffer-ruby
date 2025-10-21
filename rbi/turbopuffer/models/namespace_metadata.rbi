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

      # The schema of the namespace.
      sig { returns(T::Hash[Symbol, Turbopuffer::AttributeSchemaConfig]) }
      attr_accessor :schema

      # The timestamp when the namespace was last modified by a write operation.
      sig { returns(Time) }
      attr_accessor :updated_at

      # Indicates that the namespace is encrypted with a customer-managed encryption key
      # (CMEK).
      sig do
        returns(T.nilable(Turbopuffer::NamespaceMetadata::Encryption::Variants))
      end
      attr_reader :encryption

      sig do
        params(
          encryption:
            T.any(
              T::Boolean,
              Turbopuffer::NamespaceMetadata::Encryption::Cmek::OrHash
            )
        ).void
      end
      attr_writer :encryption

      sig do
        returns(T.nilable(Turbopuffer::NamespaceMetadata::Index::Variants))
      end
      attr_reader :index

      sig do
        params(
          index:
            T.any(
              Turbopuffer::NamespaceMetadata::Index::Status::OrHash,
              Turbopuffer::NamespaceMetadata::Index::UnionMember1::OrHash
            )
        ).void
      end
      attr_writer :index

      # Metadata about a namespace.
      sig do
        params(
          approx_logical_bytes: Integer,
          approx_row_count: Integer,
          created_at: Time,
          schema: T::Hash[Symbol, Turbopuffer::AttributeSchemaConfig::OrHash],
          updated_at: Time,
          encryption:
            T.any(
              T::Boolean,
              Turbopuffer::NamespaceMetadata::Encryption::Cmek::OrHash
            ),
          index:
            T.any(
              Turbopuffer::NamespaceMetadata::Index::Status::OrHash,
              Turbopuffer::NamespaceMetadata::Index::UnionMember1::OrHash
            )
        ).returns(T.attached_class)
      end
      def self.new(
        # The approximate number of logical bytes in the namespace.
        approx_logical_bytes:,
        # The approximate number of rows in the namespace.
        approx_row_count:,
        # The timestamp when the namespace was created.
        created_at:,
        # The schema of the namespace.
        schema:,
        # The timestamp when the namespace was last modified by a write operation.
        updated_at:,
        # Indicates that the namespace is encrypted with a customer-managed encryption key
        # (CMEK).
        encryption: nil,
        index: nil
      )
      end

      sig do
        override.returns(
          {
            approx_logical_bytes: Integer,
            approx_row_count: Integer,
            created_at: Time,
            schema: T::Hash[Symbol, Turbopuffer::AttributeSchemaConfig],
            updated_at: Time,
            encryption: Turbopuffer::NamespaceMetadata::Encryption::Variants,
            index: Turbopuffer::NamespaceMetadata::Index::Variants
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
            T.any(T::Boolean, Turbopuffer::NamespaceMetadata::Encryption::Cmek)
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
            returns(
              T.nilable(Turbopuffer::NamespaceMetadata::Encryption::Cmek::Cmek)
            )
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
          def self.new(cmek: nil)
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
              Turbopuffer::NamespaceMetadata::Index::Status,
              Turbopuffer::NamespaceMetadata::Index::UnionMember1
            )
          end

        class Status < Turbopuffer::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Turbopuffer::NamespaceMetadata::Index::Status,
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

        class UnionMember1 < Turbopuffer::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Turbopuffer::NamespaceMetadata::Index::UnionMember1,
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
    end
  end
end
