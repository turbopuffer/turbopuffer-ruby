# typed: strong

module Turbopuffer
  module Models
    class NamespaceDeleteAllResponse < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::Models::NamespaceDeleteAllResponse,
            Turbopuffer::Internal::AnyHash
          )
        end

      # The status of the request.
      sig { returns(Symbol) }
      attr_accessor :status

      # The response to a successful namespace deletion request.
      sig { params(status: Symbol).returns(T.attached_class) }
      def self.new(
        # The status of the request.
        status: :OK
      )
      end

      sig { override.returns({ status: Symbol }) }
      def to_hash
      end
    end
  end
end
