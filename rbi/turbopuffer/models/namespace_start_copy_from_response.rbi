# typed: strong

module Turbopuffer
  module Models
    class NamespaceStartCopyFromResponse < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::Models::NamespaceStartCopyFromResponse,
            Turbopuffer::Internal::AnyHash
          )
        end

      # The token identifying the copy operation.
      sig { returns(String) }
      attr_accessor :token

      sig { params(token: String).returns(T.attached_class) }
      def self.new(
        # The token identifying the copy operation.
        token:
      )
      end

      sig { override.returns({ token: String }) }
      def to_hash
      end
    end
  end
end
