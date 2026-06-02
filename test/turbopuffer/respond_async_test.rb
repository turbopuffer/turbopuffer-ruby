# frozen_string_literal: true

require_relative "test_helper"

class Turbopuffer::Test::RespondAsyncTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  WRITE_OK_BODY = {
    "billing" => {
      "billable_logical_bytes_written" => 0,
      "billable_logical_bytes_returned" => 0
    },
    "message" => "OK",
    "rows_affected" => 1,
    "status" => "OK"
  }.freeze

  def before_all
    super
    WebMock.enable!
  end

  def setup
    super
    Thread.current.thread_variable_set(:mock_sleep, [])
  end

  def teardown
    Thread.current.thread_variable_set(:mock_sleep, nil)
    WebMock.reset!
    super
  end

  def after_all
    WebMock.disable!
    super
  end

  def build_client(**overrides)
    Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...", **overrides)
  end

  def test_prefer_header_sent
    stub_request(:post, "http://localhost/v2/namespaces/test")
      .to_return_json(status: 200, body: WRITE_OK_BODY)

    build_client.namespace("test").write(upsert_columns: {id: [1], vector: [[0.1]]})

    assert_requested(:post, "http://localhost/v2/namespaces/test") do |req|
      assert_equal("respond-async", req.headers.fetch("Prefer"))
    end
  end

  def test_prefer_header_can_be_cleared
    stub_request(:post, "http://localhost/v2/namespaces/test")
      .to_return_json(status: 200, body: WRITE_OK_BODY)

    build_client.namespace("test").write(
      upsert_columns: {id: [1], vector: [[0.1]]},
      request_options: {extra_headers: {"prefer" => ""}}
    )

    assert_requested(:post, "http://localhost/v2/namespaces/test") do |req|
      refute_includes(req.headers.keys, "Prefer")
    end
  end

  def test_pass_through_sync_response
    stub_request(:post, "http://localhost/v2/namespaces/test")
      .to_return_json(status: 200, body: WRITE_OK_BODY)

    resp = build_client.namespace("test").write(upsert_columns: {id: [1], vector: [[0.1]]})

    assert_equal("OK", resp.status.to_s)
    assert_equal(1, resp.rows_affected)
    assert_requested(:post, "http://localhost/v2/namespaces/test", times: 1)
  end

  def test_pass_through_unrelated_202
    stub_request(:post, "http://localhost/v2/namespaces/test")
      .to_return_json(status: 202, body: WRITE_OK_BODY)

    resp = build_client.namespace("test").write(upsert_columns: {id: [1], vector: [[0.1]]})

    assert_equal("OK", resp.status.to_s)
    assert_requested(:post, "http://localhost/v2/namespaces/test", times: 1)
  end

  def test_async_applied_and_polled_to_success
    poll_url = "http://localhost/v1/namespaces/test/operations/op-abc"
    stub_request(:post, "http://localhost/v2/namespaces/test").to_return(
      status: 202,
      headers: {"preference-applied" => "respond-async", "location" => poll_url}
    )
    stub_request(:get, poll_url).to_return_json(
      [
        {status: 200, body: {status: "running"}},
        {status: 200, body: {status: "running"}},
        {status: 200, body: {status: "finished", result: {success: WRITE_OK_BODY}}}
      ]
    )

    resp = build_client.namespace("test").write(upsert_columns: {id: [1], vector: [[0.1]]})

    assert_equal("OK", resp.status.to_s)
    assert_equal(1, resp.rows_affected)
    assert_requested(:post, "http://localhost/v2/namespaces/test", times: 1)
    assert_requested(:get, poll_url, times: 3)
  end

  def test_poll_request_headers
    poll_url = "http://localhost/v1/namespaces/test/operations/op-abc"
    stub_request(:post, "http://localhost/v2/namespaces/test").to_return(
      status: 202,
      headers: {"preference-applied" => "respond-async", "location" => poll_url}
    )
    stub_request(:get, poll_url).to_return_json(
      status: 200,
      body: {status: "finished", result: {success: WRITE_OK_BODY}}
    )

    build_client.namespace("test").write(upsert_columns: {id: [1], vector: [[0.1]]})

    assert_requested(:get, poll_url) do |req|
      refute_includes(req.headers.keys, "Prefer")

      auth = req.headers.fetch("Authorization")
      assert_equal("Bearer tpuf_A1...", auth)
    end
  end

  def test_async_finished_with_404_error
    poll_url = "http://localhost/v1/namespaces/test/operations/op-fail"
    stub_request(:post, "http://localhost/v2/namespaces/test").to_return(
      status: 202,
      headers: {"preference-applied" => "respond-async", "location" => poll_url}
    )
    stub_request(:get, poll_url).to_return_json(
      status: 200,
      body: {
        status: "finished",
        result: {error: {status_code: 404, detail: {message: "namespace not found"}}}
      }
    )

    err = assert_raises(Turbopuffer::Errors::NotFoundError) do
      build_client.namespace("test").write(upsert_columns: {id: [1], vector: [[0.1]]})
    end
    assert_equal(404, err.status)
    assert_match(/namespace not found/, err.message)
  end

  def test_async_finished_with_500_error
    poll_url = "http://localhost/v1/namespaces/test/operations/op-fail"
    stub_request(:post, "http://localhost/v2/namespaces/test").to_return(
      status: 202,
      headers: {"preference-applied" => "respond-async", "location" => poll_url}
    )
    stub_request(:get, poll_url).to_return_json(
      status: 200,
      body: {status: "finished", result: {error: {status_code: 500, detail: {message: "oops"}}}}
    )

    assert_raises(Turbopuffer::Errors::InternalServerError) do
      build_client.namespace("test").write(upsert_columns: {id: [1], vector: [[0.1]]})
    end
  end

  def test_poll_transient_failure
    poll_url = "http://localhost/v1/namespaces/test/operations/op-flaky"
    stub_request(:post, "http://localhost/v2/namespaces/test").to_return(
      status: 202,
      headers: {"preference-applied" => "respond-async", "location" => poll_url}
    )
    stub_request(:get, poll_url).to_return_json(
      [
        {status: 503, body: {}},
        {status: 503, body: {}},
        {status: 200, body: {status: "finished", result: {success: WRITE_OK_BODY}}}
      ]
    )

    resp = build_client.namespace("test").write(upsert_columns: {id: [1], vector: [[0.1]]})

    assert_equal("OK", resp.status.to_s)
    assert_requested(:get, poll_url, times: 3)
  end

  def test_poll_too_many_failures
    poll_url = "http://localhost/v1/namespaces/test/operations/op-dead"
    stub_request(:post, "http://localhost/v2/namespaces/test").to_return(
      status: 202,
      headers: {"preference-applied" => "respond-async", "location" => poll_url}
    )
    stub_request(:get, poll_url).to_return_json(status: 503, body: {})

    client = build_client(max_retries: 0)
    assert_raises(Turbopuffer::Errors::InternalServerError) do
      client.namespace("test").write(upsert_columns: {id: [1], vector: [[0.1]]})
    end
  end

  def test_async_applied_missing_location_header
    stub_request(:post, "http://localhost/v2/namespaces/test").to_return(
      status: 202,
      headers: {"preference-applied" => "respond-async"}
    )

    err = assert_raises(Turbopuffer::Errors::APIError) do
      build_client.namespace("test").write(upsert_columns: {id: [1], vector: [[0.1]]})
    end
    assert_match(/location/i, err.message)
  end

  BAD_LOCATIONS = [
    "https://evil.example.com/v1/ops/op-x",
    "//evil.example.com/v1/ops/op-x",
    "http://api.turbopuffer.com/v1/ops/op-x",
    "http://host:notaport/x"
  ].freeze

  def test_async_applied_bad_location_header
    BAD_LOCATIONS.each do |bad_location|
      WebMock.reset!
      stub_request(:post, "http://localhost/v2/namespaces/test").to_return(
        status: 202,
        headers: {"preference-applied" => "respond-async", "location" => bad_location}
      )

      assert_raises(
        Turbopuffer::Errors::APIError,
        "expected APIError for location: #{bad_location.inspect}"
      ) do
        build_client.namespace("test").write(upsert_columns: {id: [1], vector: [[0.1]]})
      end
    end
  end

  def test_malformed_poll_body
    poll_url = "http://localhost/v1/namespaces/test/operations/op-bad"
    stub_request(:post, "http://localhost/v2/namespaces/test").to_return(
      status: 202,
      headers: {"preference-applied" => "respond-async", "location" => poll_url}
    )
    stub_request(:get, poll_url).to_return(
      status: 200,
      headers: {"content-type" => "application/json"},
      body: "not-a-json-object"
    )

    assert_raises(Turbopuffer::Errors::APIError) do
      build_client.namespace("test").write(upsert_columns: {id: [1], vector: [[0.1]]})
    end
  end

  def test_async_polling_respects_request_timeout
    poll_url = "http://localhost/v1/namespaces/test/operations/op-slow"
    stub_request(:post, "http://localhost/v2/namespaces/test").to_return(
      status: 202,
      headers: {"preference-applied" => "respond-async", "location" => poll_url}
    )
    stub_request(:get, poll_url).to_return_json(status: 200, body: {status: "running"})

    client = build_client(timeout: 1)
    assert_raises(Turbopuffer::Errors::APITimeoutError) do
      client.namespace("test").write(upsert_columns: {id: [1], vector: [[0.1]]})
    end
  end
end
