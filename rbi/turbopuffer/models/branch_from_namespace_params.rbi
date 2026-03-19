# typed: strong

module Turbopuffer
  module Models
    # The namespace to create an instant, copy-on-write clone of.
    module BranchFromNamespaceParams
      extend Turbopuffer::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            String,
            Turbopuffer::BranchFromNamespaceParams::BranchFromNamespaceConfig
          )
        end

      class BranchFromNamespaceConfig < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::BranchFromNamespaceParams::BranchFromNamespaceConfig,
              Turbopuffer::Internal::AnyHash
            )
          end

        # The namespace to create an instant, copy-on-write clone of.
        sig { returns(String) }
        attr_accessor :source_namespace

        sig { params(source_namespace: String).returns(T.attached_class) }
        def self.new(
          # The namespace to create an instant, copy-on-write clone of.
          source_namespace:
        )
        end

        sig { override.returns({ source_namespace: String }) }
        def to_hash
        end
      end

      sig do
        override.returns(
          T::Array[Turbopuffer::BranchFromNamespaceParams::Variants]
        )
      end
      def self.variants
      end
    end
  end
end
