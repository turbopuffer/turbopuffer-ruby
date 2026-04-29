# typed: strong

module Turbopuffer
  module Models
    # The encryption configuration for a namespace.
    module Encryption
      extend Turbopuffer::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Turbopuffer::Encryption::CustomerManaged,
            Turbopuffer::Encryption::Default
          )
        end

      class CustomerManaged < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::Encryption::CustomerManaged,
              Turbopuffer::Internal::AnyHash
            )
          end

        # The identifier of the CMEK key to use for encryption. For GCP, the
        # fully-qualified resource name of the key. For AWS, the ARN of the key.
        sig { returns(String) }
        attr_accessor :key_name

        sig { returns(Symbol) }
        attr_accessor :mode

        # Encrypt the namespace with a customer-managed encryption key (CMEK).
        sig { params(key_name: String, mode: Symbol).returns(T.attached_class) }
        def self.new(
          # The identifier of the CMEK key to use for encryption. For GCP, the
          # fully-qualified resource name of the key. For AWS, the ARN of the key.
          key_name:,
          mode: :"customer-managed"
        )
        end

        sig { override.returns({ key_name: String, mode: Symbol }) }
        def to_hash
        end
      end

      class Default < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::Encryption::Default,
              Turbopuffer::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :mode

        # Use the default server-side encryption (SSE).
        sig { params(mode: Symbol).returns(T.attached_class) }
        def self.new(mode: :default)
        end

        sig { override.returns({ mode: Symbol }) }
        def to_hash
        end
      end

      sig { override.returns(T::Array[Turbopuffer::Encryption::Variants]) }
      def self.variants
      end
    end
  end
end
