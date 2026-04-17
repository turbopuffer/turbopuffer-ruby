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
      sig do
        returns(
          T.any(
            String,
            Turbopuffer::BranchFromNamespaceParams::BranchFromNamespaceConfig
          )
        )
      end
      attr_accessor :branch_from_namespace

      sig do
        params(
          branch_from_namespace:
            T.any(
              String,
              Turbopuffer::BranchFromNamespaceParams::BranchFromNamespaceConfig::OrHash
            ),
          namespace: String,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The namespace to create an instant, copy-on-write clone of.
        branch_from_namespace:,
        namespace: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            namespace: String,
            branch_from_namespace:
              T.any(
                String,
                Turbopuffer::BranchFromNamespaceParams::BranchFromNamespaceConfig
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
