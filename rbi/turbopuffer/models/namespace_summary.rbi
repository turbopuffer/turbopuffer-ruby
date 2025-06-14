# typed: strong

module Turbopuffer
  module Models
    class NamespaceSummary < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::NamespaceSummary, Turbopuffer::Internal::AnyHash)
        end

      # The namespace ID.
      sig { returns(String) }
      attr_accessor :id

      # A summary of a namespace.
      sig { params(id: String).returns(T.attached_class) }
      def self.new(
        # The namespace ID.
        id:
      )
      end

      sig { override.returns({ id: String }) }
      def to_hash
      end
    end
  end
end
