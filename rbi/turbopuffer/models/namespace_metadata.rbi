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

      # The timestamp when the namespace was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The schema of the namespace.
      sig { returns(T::Hash[Symbol, Turbopuffer::AttributeSchemaConfig]) }
      attr_accessor :schema

      # Metadata about a namespace.
      sig do
        params(
          approx_logical_bytes: Integer,
          created_at: Time,
          schema: T::Hash[Symbol, Turbopuffer::AttributeSchemaConfig::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # The approximate number of logical bytes in the namespace.
        approx_logical_bytes:,
        # The timestamp when the namespace was created.
        created_at:,
        # The schema of the namespace.
        schema:
      )
      end

      sig do
        override.returns(
          {
            approx_logical_bytes: Integer,
            created_at: Time,
            schema: T::Hash[Symbol, Turbopuffer::AttributeSchemaConfig]
          }
        )
      end
      def to_hash
      end
    end
  end
end
