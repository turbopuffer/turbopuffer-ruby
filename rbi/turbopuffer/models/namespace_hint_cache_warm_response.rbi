# typed: strong

module Turbopuffer
  module Models
    class NamespaceHintCacheWarmResponse < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::Models::NamespaceHintCacheWarmResponse,
            Turbopuffer::Internal::AnyHash
          )
        end

      # The status of the request.
      sig { returns(Symbol) }
      attr_accessor :status

      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # The response to a successful cache warm request.
      sig { params(message: String, status: Symbol).returns(T.attached_class) }
      def self.new(
        message: nil,
        # The status of the request.
        status: :OK
      )
      end

      sig { override.returns({ status: Symbol, message: String }) }
      def to_hash
      end
    end
  end
end
