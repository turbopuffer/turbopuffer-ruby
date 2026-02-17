# typed: strong

module Turbopuffer
  AggregationGroup =
    T.let(
      Turbopuffer::Models::AggregationGroup,
      Turbopuffer::Internal::Type::Converter
    )

  AttributeSchema = Turbopuffer::Models::AttributeSchema

  AttributeSchemaConfig = Turbopuffer::Models::AttributeSchemaConfig

  AttributeType = Turbopuffer::Models::AttributeType

  Bm25ClauseParams = Turbopuffer::Models::Bm25ClauseParams

  ClientNamespacesParams = Turbopuffer::Models::ClientNamespacesParams

  Columns = Turbopuffer::Models::Columns

  ContainsAllTokensFilterParams =
    Turbopuffer::Models::ContainsAllTokensFilterParams

  ContainsAnyTokenFilterParams =
    Turbopuffer::Models::ContainsAnyTokenFilterParams

  DecayParams = Turbopuffer::Models::DecayParams

  DistanceMetric = Turbopuffer::Models::DistanceMetric

  FullTextSearch = Turbopuffer::Models::FullTextSearch

  FullTextSearchConfig = Turbopuffer::Models::FullTextSearchConfig

  ID = Turbopuffer::Models::ID

  IncludeAttributes = Turbopuffer::Models::IncludeAttributes

  Language = Turbopuffer::Models::Language

  Limit = Turbopuffer::Models::Limit

  NamespaceDeleteAllParams = Turbopuffer::Models::NamespaceDeleteAllParams

  NamespaceExplainQueryParams = Turbopuffer::Models::NamespaceExplainQueryParams

  NamespaceHintCacheWarmParams =
    Turbopuffer::Models::NamespaceHintCacheWarmParams

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

  SaturateParams = Turbopuffer::Models::SaturateParams

  Tokenizer = Turbopuffer::Models::Tokenizer

  Vector = Turbopuffer::Models::Vector

  VectorEncoding = Turbopuffer::Models::VectorEncoding

  WriteBilling = Turbopuffer::Models::WriteBilling
end
