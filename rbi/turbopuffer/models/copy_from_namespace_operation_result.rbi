# typed: strong

module Turbopuffer
  module Models
    module CopyFromNamespaceOperationResult
      extend Turbopuffer::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Turbopuffer::CopyFromNamespaceOperationResult::Success,
            Turbopuffer::CopyFromNamespaceOperationResult::Error
          )
        end

      class Success < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::CopyFromNamespaceOperationResult::Success,
              Turbopuffer::Internal::AnyHash
            )
          end

        # The response to a successful write request.
        sig { returns(Turbopuffer::WriteResult) }
        attr_reader :success

        sig { params(success: Turbopuffer::WriteResult::OrHash).void }
        attr_writer :success

        sig do
          params(success: Turbopuffer::WriteResult::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(
          # The response to a successful write request.
          success:
        )
        end

        sig { override.returns({ success: Turbopuffer::WriteResult }) }
        def to_hash
        end
      end

      class Error < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::CopyFromNamespaceOperationResult::Error,
              Turbopuffer::Internal::AnyHash
            )
          end

        sig { returns(Turbopuffer::OperationError) }
        attr_reader :error

        sig { params(error: Turbopuffer::OperationError::OrHash).void }
        attr_writer :error

        sig do
          params(error: Turbopuffer::OperationError::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(error:)
        end

        sig { override.returns({ error: Turbopuffer::OperationError }) }
        def to_hash
        end
      end

      sig do
        override.returns(
          T::Array[Turbopuffer::CopyFromNamespaceOperationResult::Variants]
        )
      end
      def self.variants
      end
    end
  end
end
