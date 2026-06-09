# typed: strong

module Turbopuffer
  module Models
    class NamespaceCopyFromParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::NamespaceCopyFromParams,
            Turbopuffer::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :namespace

      sig { params(namespace: String).void }
      attr_writer :namespace

      # The namespace to copy documents from.
      sig { returns(String) }
      attr_accessor :source_namespace

      # (Optional) The encryption configuration for the destination namespace.
      sig do
        returns(
          T.nilable(
            T.any(
              Turbopuffer::Encryption::CustomerManaged,
              Turbopuffer::Encryption::Default
            )
          )
        )
      end
      attr_reader :dest_encryption

      sig do
        params(
          dest_encryption:
            T.any(
              Turbopuffer::Encryption::CustomerManaged::OrHash,
              Turbopuffer::Encryption::Default::OrHash
            )
        ).void
      end
      attr_writer :dest_encryption

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
          namespace: String,
          dest_encryption:
            T.any(
              Turbopuffer::Encryption::CustomerManaged::OrHash,
              Turbopuffer::Encryption::Default::OrHash
            ),
          source_api_key: String,
          source_region: String,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The namespace to copy documents from.
        source_namespace:,
        namespace: nil,
        # (Optional) The encryption configuration for the destination namespace.
        dest_encryption: nil,
        # (Optional) An API key for the organization containing the source namespace
        source_api_key: nil,
        # (Optional) The region of the source namespace.
        source_region: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            namespace: String,
            source_namespace: String,
            dest_encryption:
              T.any(
                Turbopuffer::Encryption::CustomerManaged,
                Turbopuffer::Encryption::Default
              ),
            source_api_key: String,
            source_region: String,
            request_options: Turbopuffer::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
