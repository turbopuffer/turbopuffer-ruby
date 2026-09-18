# typed: strong

module Turbopuffer
  module Models
    class NamespacePollCopyFromParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::NamespacePollCopyFromParams,
            Turbopuffer::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :namespace

      sig { params(namespace: String).void }
      attr_writer :namespace

      sig { returns(String) }
      attr_accessor :token

      sig do
        params(
          token: String,
          namespace: String,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(token:, namespace: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            namespace: String,
            token: String,
            request_options: Turbopuffer::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
