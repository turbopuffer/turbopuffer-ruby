# typed: strong

module Turbopuffer
  module Models
    class OperationError < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::OperationError, Turbopuffer::Internal::AnyHash)
        end

      # The response to an unsuccessful request.
      sig { returns(Turbopuffer::OperationError::Detail) }
      attr_reader :detail

      sig { params(detail: Turbopuffer::OperationError::Detail::OrHash).void }
      attr_writer :detail

      # The HTTP status code of the operation's error.
      sig { returns(Integer) }
      attr_accessor :status_code

      sig do
        params(
          detail: Turbopuffer::OperationError::Detail::OrHash,
          status_code: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # The response to an unsuccessful request.
        detail:,
        # The HTTP status code of the operation's error.
        status_code:
      )
      end

      sig do
        override.returns(
          { detail: Turbopuffer::OperationError::Detail, status_code: Integer }
        )
      end
      def to_hash
      end

      class Detail < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::OperationError::Detail,
              Turbopuffer::Internal::AnyHash
            )
          end

        # The error message.
        sig { returns(String) }
        attr_accessor :error

        # The status of the request.
        sig { returns(Symbol) }
        attr_accessor :status

        # The response to an unsuccessful request.
        sig { params(error: String, status: Symbol).returns(T.attached_class) }
        def self.new(
          # The error message.
          error:,
          # The status of the request.
          status: :error
        )
        end

        sig { override.returns({ error: String, status: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
