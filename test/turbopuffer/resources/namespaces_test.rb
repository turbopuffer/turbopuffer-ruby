# frozen_string_literal: true

require_relative "../test_helper"

class Turbopuffer::Test::Resources::NamespacesTest < Turbopuffer::Test::ResourceTest
  def test_delete_all_required_params
    skip("Prism tests are disabled")

    response = @turbopuffer.namespaces.delete_all(namespace: "namespace")

    assert_pattern do
      response => Turbopuffer::Models::NamespaceDeleteAllResponse
    end

    assert_pattern do
      response => {
        status: Symbol
      }
    end
  end

  def test_explain_query_required_params
    skip("Prism tests are disabled")

    response = @turbopuffer.namespaces.explain_query(namespace: "namespace")

    assert_pattern do
      response => Turbopuffer::Models::NamespaceExplainQueryResponse
    end

    assert_pattern do
      response => {
        plan_text: String | nil
      }
    end
  end

  def test_hint_cache_warm_required_params
    skip("Prism tests are disabled")

    response = @turbopuffer.namespaces.hint_cache_warm(namespace: "namespace")

    assert_pattern do
      response => Turbopuffer::Models::NamespaceHintCacheWarmResponse
    end

    assert_pattern do
      response => {
        status: Symbol,
        message: String | nil
      }
    end
  end

  def test_metadata_required_params
    skip("Prism tests are disabled")

    response = @turbopuffer.namespaces.metadata(namespace: "namespace")

    assert_pattern do
      response => Turbopuffer::NamespaceMetadata
    end

    assert_pattern do
      response => {
        approx_logical_bytes: Integer,
        approx_row_count: Integer,
        created_at: Time,
        schema: ^(Turbopuffer::Internal::Type::HashOf[Turbopuffer::AttributeSchemaConfig])
      }
    end
  end

  def test_multi_query_required_params
    skip("Prism tests are disabled")

    response = @turbopuffer.namespaces.multi_query(namespace: "namespace", queries: [{}])

    assert_pattern do
      response => Turbopuffer::Models::NamespaceMultiQueryResponse
    end

    assert_pattern do
      response => {
        billing: Turbopuffer::QueryBilling,
        performance: Turbopuffer::QueryPerformance,
        results: ^(Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Models::NamespaceMultiQueryResponse::Result])
      }
    end
  end

  def test_query_required_params
    skip("Prism tests are disabled")

    response = @turbopuffer.namespaces.query(namespace: "namespace")

    assert_pattern do
      response => Turbopuffer::Models::NamespaceQueryResponse
    end

    assert_pattern do
      response => {
        billing: Turbopuffer::QueryBilling,
        performance: Turbopuffer::QueryPerformance,
        aggregations: ^(Turbopuffer::Internal::Type::HashOf[Turbopuffer::Internal::Type::Unknown]) | nil,
        rows: ^(Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Row]) | nil
      }
    end
  end

  def test_recall_required_params
    skip("Prism tests are disabled")

    response = @turbopuffer.namespaces.recall(namespace: "namespace")

    assert_pattern do
      response => Turbopuffer::Models::NamespaceRecallResponse
    end

    assert_pattern do
      response => {
        avg_ann_count: Float,
        avg_exhaustive_count: Float,
        avg_recall: Float
      }
    end
  end

  def test_schema_required_params
    skip("Prism tests are disabled")

    response = @turbopuffer.namespaces.schema(namespace: "namespace")

    assert_pattern do
      response => ^(Turbopuffer::Internal::Type::HashOf[Turbopuffer::AttributeSchemaConfig])
    end
  end

  def test_update_schema_required_params
    skip("Prism tests are disabled")

    response = @turbopuffer.namespaces.update_schema(namespace: "namespace")

    assert_pattern do
      response => ^(Turbopuffer::Internal::Type::HashOf[Turbopuffer::AttributeSchemaConfig])
    end
  end

  def test_write_required_params
    skip("Prism tests are disabled")

    response = @turbopuffer.namespaces.write(namespace: "namespace")

    assert_pattern do
      response => Turbopuffer::Models::NamespaceWriteResponse
    end

    assert_pattern do
      response => {
        billing: Turbopuffer::WriteBilling,
        message: String,
        rows_affected: Integer,
        status: Symbol,
        rows_deleted: Integer | nil,
        rows_patched: Integer | nil,
        rows_upserted: Integer | nil
      }
    end
  end
end
