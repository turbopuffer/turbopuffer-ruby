# typed: strong

module Turbopuffer
  module Models
    AggregationGroup =
      T.let(
        Turbopuffer::Internal::Type::HashOf[
          Turbopuffer::Internal::Type::Unknown
        ],
        Turbopuffer::Internal::Type::Converter
      )
  end
end
