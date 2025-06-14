# typed: strong

module Turbopuffer
  module Models
    NamespaceUpdateSchemaResponse =
      T.let(
        Turbopuffer::Internal::Type::HashOf[Turbopuffer::AttributeSchemaConfig],
        Turbopuffer::Internal::Type::Converter
      )
  end
end
