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
      sig do
        returns(
          T.any(
            String,
            Turbopuffer::CopyFromNamespaceParams::CopyFromNamespaceConfig
          )
        )
      end
      attr_accessor :copy_from_namespace

      sig do
        params(
          copy_from_namespace:
            T.any(
              String,
              Turbopuffer::CopyFromNamespaceParams::CopyFromNamespaceConfig::OrHash
            ),
          namespace: String,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The namespace to copy documents from.
        copy_from_namespace:,
        namespace: nil,
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
                Turbopuffer::CopyFromNamespaceParams::CopyFromNamespaceConfig
              ),
            request_options: Turbopuffer::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
