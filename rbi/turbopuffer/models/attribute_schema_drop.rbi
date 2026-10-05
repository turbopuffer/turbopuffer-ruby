# typed: strong

module Turbopuffer
  module Models
    class AttributeSchemaDrop < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::AttributeSchemaDrop,
            Turbopuffer::Internal::AnyHash
          )
        end

      # Must be `true`.
      sig { returns(T::Boolean) }
      attr_accessor :drop

      # Drops the attribute from the namespace. Cannot be combined with other schema
      # settings.
      sig { params(drop: T::Boolean).returns(T.attached_class) }
      def self.new(
        # Must be `true`.
        drop:
      )
      end

      sig { override.returns({ drop: T::Boolean }) }
      def to_hash
      end
    end
  end
end
