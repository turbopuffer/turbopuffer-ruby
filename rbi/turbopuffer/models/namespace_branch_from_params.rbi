# typed: strong

module Turbopuffer
  module Models
    class NamespaceBranchFromParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::NamespaceBranchFromParams,
            Turbopuffer::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :namespace

      sig { params(namespace: String).void }
      attr_writer :namespace

      # The namespace to create an instant, copy-on-write clone of.
      sig { returns(String) }
      attr_accessor :source_namespace

      sig do
        params(
          source_namespace: String,
          namespace: String,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The namespace to create an instant, copy-on-write clone of.
        source_namespace:,
        namespace: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            namespace: String,
            source_namespace: String,
            request_options: Turbopuffer::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
