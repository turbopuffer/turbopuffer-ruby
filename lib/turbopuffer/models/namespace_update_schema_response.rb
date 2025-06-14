# frozen_string_literal: true

module Turbopuffer
  module Models
    # @type [Turbopuffer::Internal::Type::Converter]
    NamespaceUpdateSchemaResponse =
      Turbopuffer::Internal::Type::HashOf[-> { Turbopuffer::AttributeSchemaConfig }]
  end
end
