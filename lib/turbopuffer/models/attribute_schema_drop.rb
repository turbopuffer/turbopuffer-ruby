# frozen_string_literal: true

module Turbopuffer
  module Models
    class AttributeSchemaDrop < Turbopuffer::Internal::Type::BaseModel
      # @!attribute drop
      #   Must be `true`.
      #
      #   @return [Boolean]
      required :drop, Turbopuffer::Internal::Type::Boolean

      # @!method initialize(drop:)
      #   Drops the attribute from the namespace. Cannot be combined with other schema
      #   settings.
      #
      #   @param drop [Boolean] Must be `true`.
    end
  end
end
