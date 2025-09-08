# frozen_string_literal: true

module Turbopuffer
  [Turbopuffer::Internal::Type::BaseModel, *Turbopuffer::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Turbopuffer::Internal::AnyHash) } }
  end

  Turbopuffer::Internal::Util.walk_namespaces(Turbopuffer::Models).each do |mod|
    case mod
    in Turbopuffer::Internal::Type::Enum | Turbopuffer::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  Turbopuffer::Internal::Util.walk_namespaces(Turbopuffer::Models)
                             .lazy
                             .grep(Turbopuffer::Internal::Type::Union)
                             .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  # @type [Turbopuffer::Internal::Type::Converter]
  AggregationGroup = Turbopuffer::Models::AggregationGroup

  AttributeSchema = Turbopuffer::Models::AttributeSchema

  AttributeSchemaConfig = Turbopuffer::Models::AttributeSchemaConfig

  AttributeType = Turbopuffer::Models::AttributeType

  ClientNamespacesParams = Turbopuffer::Models::ClientNamespacesParams

  Columns = Turbopuffer::Models::Columns

  DistanceMetric = Turbopuffer::Models::DistanceMetric

  FullTextSearch = Turbopuffer::Models::FullTextSearch

  FullTextSearchConfig = Turbopuffer::Models::FullTextSearchConfig

  ID = Turbopuffer::Models::ID

  IncludeAttributes = Turbopuffer::Models::IncludeAttributes

  Language = Turbopuffer::Models::Language

  NamespaceDeleteAllParams = Turbopuffer::Models::NamespaceDeleteAllParams

  NamespaceExplainQueryParams = Turbopuffer::Models::NamespaceExplainQueryParams

  NamespaceHintCacheWarmParams = Turbopuffer::Models::NamespaceHintCacheWarmParams

  NamespaceMetadata = Turbopuffer::Models::NamespaceMetadata

  NamespaceMetadataParams = Turbopuffer::Models::NamespaceMetadataParams

  NamespaceMultiQueryParams = Turbopuffer::Models::NamespaceMultiQueryParams

  NamespaceQueryParams = Turbopuffer::Models::NamespaceQueryParams

  NamespaceRecallParams = Turbopuffer::Models::NamespaceRecallParams

  NamespaceSchemaParams = Turbopuffer::Models::NamespaceSchemaParams

  NamespaceSummary = Turbopuffer::Models::NamespaceSummary

  NamespaceUpdateSchemaParams = Turbopuffer::Models::NamespaceUpdateSchemaParams

  NamespaceWriteParams = Turbopuffer::Models::NamespaceWriteParams

  Query = Turbopuffer::Models::Query

  QueryBilling = Turbopuffer::Models::QueryBilling

  QueryPerformance = Turbopuffer::Models::QueryPerformance

  Row = Turbopuffer::Models::Row

  Tokenizer = Turbopuffer::Models::Tokenizer

  Vector = Turbopuffer::Models::Vector

  VectorEncoding = Turbopuffer::Models::VectorEncoding

  WriteBilling = Turbopuffer::Models::WriteBilling
end
