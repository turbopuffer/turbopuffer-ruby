# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Client#namespaces
    class NamespaceSummary < Turbopuffer::Internal::Type::BaseModel
      # @!attribute id
      #   The namespace ID.
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:)
      #   A summary of a namespace.
      #
      #   @param id [String] The namespace ID.
    end
  end
end
