# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#explain_query
    class NamespaceExplainQueryResponse < Turbopuffer::Internal::Type::BaseModel
      # @!attribute plan_text
      #   The textual representation of the query plan.
      #
      #   @return [String, nil]
      optional :plan_text, String

      # @!method initialize(plan_text: nil)
      #   The response to a successful query explain.
      #
      #   @param plan_text [String] The textual representation of the query plan.
    end
  end
end
