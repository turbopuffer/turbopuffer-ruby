# typed: strong

module Turbopuffer
  module Models
    class NamespaceMetadataParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::NamespaceMetadataParams,
            Turbopuffer::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :namespace

      sig { params(namespace: String).void }
      attr_writer :namespace

      sig do
        params(
          namespace: String,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(namespace: nil, request_options: {})
      end

      sig do
        override.returns(
          { namespace: String, request_options: Turbopuffer::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
