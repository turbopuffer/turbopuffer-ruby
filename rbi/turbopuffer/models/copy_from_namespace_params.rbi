# typed: strong

module Turbopuffer
  module Models
    # The namespace to copy documents from.
    module CopyFromNamespaceParams
      extend Turbopuffer::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            String,
            Turbopuffer::CopyFromNamespaceParams::CopyFromNamespaceConfig
          )
        end

      class CopyFromNamespaceConfig < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::CopyFromNamespaceParams::CopyFromNamespaceConfig,
              Turbopuffer::Internal::AnyHash
            )
          end

        # The namespace to copy documents from.
        sig { returns(String) }
        attr_accessor :source_namespace

        # (Optional) An API key for the organization containing the source namespace
        sig { returns(T.nilable(String)) }
        attr_reader :source_api_key

        sig { params(source_api_key: String).void }
        attr_writer :source_api_key

        # (Optional) The region of the source namespace.
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
          # (Optional) An API key for the organization containing the source namespace
          source_api_key: nil,
          # (Optional) The region of the source namespace.
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
          T::Array[Turbopuffer::CopyFromNamespaceParams::Variants]
        )
      end
      def self.variants
      end
    end
  end
end
