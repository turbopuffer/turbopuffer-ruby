# typed: strong

module Turbopuffer
  module Internal
    class NamespacePage
      include Turbopuffer::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :namespaces

      sig { returns(String) }
      attr_accessor :next_cursor

      # @api private
      sig { returns(String) }
      def inspect
      end
    end
  end
end
