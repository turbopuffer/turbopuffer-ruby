# typed: strong

module Turbopuffer
  module Models
    class NamespaceExplainQueryResponse < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::Models::NamespaceExplainQueryResponse,
            Turbopuffer::Internal::AnyHash
          )
        end

      # The textual representation of the query plan.
      sig { returns(T.nilable(String)) }
      attr_reader :plan_text

      sig { params(plan_text: String).void }
      attr_writer :plan_text

      # The response to a successful query explain.
      sig { params(plan_text: String).returns(T.attached_class) }
      def self.new(
        # The textual representation of the query plan.
        plan_text: nil
      )
      end

      sig { override.returns({ plan_text: String }) }
      def to_hash
      end
    end
  end
end
