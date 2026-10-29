# frozen_string_literal: true

require_relative "test_helper"

class TurbopufferTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

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

  def test_client_max_connections
    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...")
    assert_equal(Turbopuffer::Client::DEFAULT_MAX_CONNECTIONS, turbopuffer.max_connections)

    turbopuffer = Turbopuffer::Client.new(
      base_url: "http://localhost",
      api_key: "tpuf_A1...",
      max_connections: 4
    )
    assert_equal(4, turbopuffer.max_connections)
    assert_equal(4, turbopuffer.requester.instance_variable_get(:@size))
  end

  def test_raises_on_invalid_max_connections
    [0, -1, 1.5, "4", nil].each do |max_connections|
      e = assert_raises(ArgumentError) do
        Turbopuffer::Client.new(
          base_url: "http://localhost",
          api_key: "tpuf_A1...",
          max_connections: max_connections
        )
      end
      assert_match(/max_connections must be a positive integer/, e.message)
    end
  end

  def test_raises_on_missing_non_nullable_opts
    e = assert_raises(ArgumentError) do
      Turbopuffer::Client.new
    end
    assert_match(/is required/, e.message)
  end

  def test_client_default_request_default_retry_attempts
    stub_request(:get, "http://localhost/v1/namespaces").to_return_json(status: 500, body: {})

    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...")

    assert_raises(Turbopuffer::Errors::InternalServerError) do
      turbopuffer.namespaces
    end

    assert_requested(:any, /./, times: 5)
  end

  def test_client_given_request_default_retry_attempts
    stub_request(:get, "http://localhost/v1/namespaces").to_return_json(status: 500, body: {})

    turbopuffer =
      Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...", max_retries: 3)

    assert_raises(Turbopuffer::Errors::InternalServerError) do
      turbopuffer.namespaces
    end

    assert_requested(:any, /./, times: 4)
  end

  def test_client_default_request_given_retry_attempts
    stub_request(:get, "http://localhost/v1/namespaces").to_return_json(status: 500, body: {})

    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...")

    assert_raises(Turbopuffer::Errors::InternalServerError) do
      turbopuffer.namespaces(request_options: {max_retries: 3})
    end

    assert_requested(:any, /./, times: 4)
  end

  def test_client_given_request_given_retry_attempts
    stub_request(:get, "http://localhost/v1/namespaces").to_return_json(status: 500, body: {})

    turbopuffer =
      Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...", max_retries: 3)

    assert_raises(Turbopuffer::Errors::InternalServerError) do
      turbopuffer.namespaces(request_options: {max_retries: 4})
    end

    assert_requested(:any, /./, times: 5)
  end

  def test_client_retry_after_seconds
    stub_request(:get, "http://localhost/v1/namespaces").to_return_json(
      status: 500,
      headers: {"retry-after" => "1.3"},
      body: {}
    )

    turbopuffer =
      Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...", max_retries: 1)

    assert_raises(Turbopuffer::Errors::InternalServerError) do
      turbopuffer.namespaces
    end

    assert_requested(:any, /./, times: 2)
    assert_equal(1.3, Thread.current.thread_variable_get(:mock_sleep).last)
  end

  def test_client_retry_after_date
    time_now = Time.now

    stub_request(:get, "http://localhost/v1/namespaces").to_return_json(
      status: 500,
      headers: {"retry-after" => (time_now + 10).httpdate},
      body: {}
    )

    turbopuffer =
      Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...", max_retries: 1)

    Thread.current.thread_variable_set(:time_now, time_now)
    assert_raises(Turbopuffer::Errors::InternalServerError) do
      turbopuffer.namespaces
    end
    Thread.current.thread_variable_set(:time_now, nil)

    assert_requested(:any, /./, times: 2)
    assert_in_delta(10, Thread.current.thread_variable_get(:mock_sleep).last, 1.0)
  end

  def test_client_retry_after_ms
    stub_request(:get, "http://localhost/v1/namespaces").to_return_json(
      status: 500,
      headers: {"retry-after-ms" => "1300"},
      body: {}
    )

    turbopuffer =
      Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...", max_retries: 1)

    assert_raises(Turbopuffer::Errors::InternalServerError) do
      turbopuffer.namespaces
    end

    assert_requested(:any, /./, times: 2)
    assert_equal(1.3, Thread.current.thread_variable_get(:mock_sleep).last)
  end

  def test_retry_count_header
    stub_request(:get, "http://localhost/v1/namespaces").to_return_json(status: 500, body: {})

    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...")

    assert_raises(Turbopuffer::Errors::InternalServerError) do
      turbopuffer.namespaces
    end

    5.times do
      assert_requested(:any, /./, headers: {"x-stainless-retry-count" => _1})
    end
  end

  def test_omit_retry_count_header
    stub_request(:get, "http://localhost/v1/namespaces").to_return_json(status: 500, body: {})

    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...")

    assert_raises(Turbopuffer::Errors::InternalServerError) do
      turbopuffer.namespaces(request_options: {extra_headers: {"x-stainless-retry-count" => nil}})
    end

    assert_requested(:any, /./, times: 5) do
      refute_includes(_1.headers.keys.map(&:downcase), "x-stainless-retry-count")
    end
  end

  def test_overwrite_retry_count_header
    stub_request(:get, "http://localhost/v1/namespaces").to_return_json(status: 500, body: {})

    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...")

    assert_raises(Turbopuffer::Errors::InternalServerError) do
      turbopuffer.namespaces(request_options: {extra_headers: {"x-stainless-retry-count" => "42"}})
    end

    assert_requested(:any, /./, headers: {"x-stainless-retry-count" => "42"}, times: 5)
  end

  def test_client_redirect_307
    stub_request(:get, "http://localhost/v1/namespaces").to_return_json(
      status: 307,
      headers: {"location" => "/redirected"},
      body: {}
    )
    stub_request(:any, "http://localhost/redirected").to_return(
      status: 307,
      headers: {"location" => "/redirected"}
    )

    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...")

    assert_raises(Turbopuffer::Errors::APIConnectionError) do
      turbopuffer.namespaces(request_options: {extra_headers: {}})
    end

    recorded, = WebMock::RequestRegistry.instance.requested_signatures.hash.first

    assert_requested(:any, "http://localhost/redirected", times: Turbopuffer::Client::MAX_REDIRECTS) do
      assert_equal(recorded.method, _1.method)
      assert_equal(recorded.body, _1.body)
      assert_equal(
        recorded.headers.transform_keys(&:downcase)["content-type"],
        _1.headers.transform_keys(&:downcase)["content-type"]
      )
    end
  end

  def test_client_redirect_303
    stub_request(:get, "http://localhost/v1/namespaces").to_return_json(
      status: 303,
      headers: {"location" => "/redirected"},
      body: {}
    )
    stub_request(:get, "http://localhost/redirected").to_return(
      status: 303,
      headers: {"location" => "/redirected"}
    )

    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...")

    assert_raises(Turbopuffer::Errors::APIConnectionError) do
      turbopuffer.namespaces(request_options: {extra_headers: {}})
    end

    assert_requested(:get, "http://localhost/redirected", times: Turbopuffer::Client::MAX_REDIRECTS) do
      headers = _1.headers.keys.map(&:downcase)
      refute_includes(headers, "content-type")
      assert_nil(_1.body)
    end
  end

  def test_client_redirect_auth_keep_same_origin
    stub_request(:get, "http://localhost/v1/namespaces").to_return_json(
      status: 307,
      headers: {"location" => "/redirected"},
      body: {}
    )
    stub_request(:any, "http://localhost/redirected").to_return(
      status: 307,
      headers: {"location" => "/redirected"}
    )

    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...")

    assert_raises(Turbopuffer::Errors::APIConnectionError) do
      turbopuffer.namespaces(request_options: {extra_headers: {"authorization" => "Bearer xyz"}})
    end

    recorded, = WebMock::RequestRegistry.instance.requested_signatures.hash.first
    auth_header = recorded.headers.transform_keys(&:downcase).fetch("authorization")

    assert_equal("Bearer xyz", auth_header)
    assert_requested(:any, "http://localhost/redirected", times: Turbopuffer::Client::MAX_REDIRECTS) do
      auth_header = _1.headers.transform_keys(&:downcase).fetch("authorization")
      assert_equal("Bearer xyz", auth_header)
    end
  end

  def test_client_redirect_auth_strip_cross_origin
    stub_request(:get, "http://localhost/v1/namespaces").to_return_json(
      status: 307,
      headers: {"location" => "https://example.com/redirected"},
      body: {}
    )
    stub_request(:any, "https://example.com/redirected").to_return(
      status: 307,
      headers: {"location" => "https://example.com/redirected"}
    )

    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...")

    assert_raises(Turbopuffer::Errors::APIConnectionError) do
      turbopuffer.namespaces(request_options: {extra_headers: {"authorization" => "Bearer xyz"}})
    end

    assert_requested(:any, "https://example.com/redirected", times: Turbopuffer::Client::MAX_REDIRECTS) do
      headers = _1.headers.keys.map(&:downcase)
      refute_includes(headers, "authorization")
    end
  end

  def test_default_headers
    stub_request(:get, "http://localhost/v1/namespaces").to_return_json(status: 200, body: {})

    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...")

    turbopuffer.namespaces

    assert_requested(:any, /./) do |req|
      headers = req.headers.transform_keys(&:downcase)
      expected = req.body.nil? ? ["accept"] : %w[accept content-type]
      headers.fetch_values(*expected).each { refute_empty(_1) }
    end
  end

  class RecordingObserver < Turbopuffer::Internal::Transport::RequestObserver
    attr_reader :events

    def initialize(observe: true)
      super()
      @events = []
      @observe = observe
    end

    def start(info)
      @events << [:start, info]
      Scope.new(@events) if @observe
    end

    class Scope < Turbopuffer::Internal::Transport::RequestObserver::RequestScope
      def initialize(events)
        super()
        @events = events
      end

      def attempt_begin(attempt, request)
        @events << [:attempt_begin, attempt]
        request[:headers]["x-observed-attempt"] = attempt.to_s
      end

      def attempt_end(result) = @events << [:attempt_end, result]

      def finish(result) = @events << [:finish, result]
    end
  end

  class RaisingObserver < Turbopuffer::Internal::Transport::RequestObserver
    def start(_info) = Scope.new

    class Scope < Turbopuffer::Internal::Transport::RequestObserver::RequestScope
      def attempt_begin(_attempt, _request) = raise("attempt_begin")

      def attempt_end(_result) = raise("attempt_end")

      def finish(_result) = raise("finish")
    end
  end

  def test_request_observer
    stub_request(:get, "http://localhost/v1/namespaces")
      .to_return_json(status: 200, body: {})
    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...")
    observer = RecordingObserver.new
    turbopuffer.request_observer = observer

    result = turbopuffer.namespaces

    assert_equal([:start, :attempt_begin, :attempt_end, :finish], observer.events.map(&:first))
    _, info = observer.events.first
    assert_equal(:get, info.method)
    assert_equal("/v1/namespaces", info.url)

    _, attempt = observer.events[2]
    assert_equal(0, attempt.attempt)
    assert_equal("200", attempt.response.code)
    assert_nil(attempt.error)
    assert(attempt.reached_server)

    _, finish = observer.events.last
    assert_equal(0, finish.retries)
    assert_same(result, finish.parsed)
    assert_nil(finish.error)
    assert_same(attempt.timings, finish.timings)
    timings = finish.timings
    assert_operator(timings.attempt_begin, :<=, timings.request_ready)
    assert_operator(timings.request_ready, :<=, timings.response_headers)
    assert_operator(timings.deserialize_begin, :<=, timings.deserialize_end)

    assert_requested(:any, /./, headers: {"x-observed-attempt" => "0"}, times: 1)
  end

  def test_request_observer_retries
    stub_request(:get, "http://localhost/v1/namespaces")
      .to_return_json(status: 500, body: {})
      .then
      .to_return_json(status: 200, body: {})
    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...", max_retries: 1)
    observer = RecordingObserver.new
    turbopuffer.request_observer = observer

    result = turbopuffer.namespaces

    assert_equal(
      [:start, :attempt_begin, :attempt_end, :attempt_begin, :attempt_end, :finish],
      observer.events.map(&:first)
    )
    attempts = observer.events.filter_map { _2 if _1 == :attempt_end }
    assert_equal([0, 1], attempts.map(&:attempt))
    assert_equal(%w[500 200], attempts.map { _1.response.code })
    refute_same(*attempts.map(&:timings))
    assert_nil(attempts.first.timings.deserialize_begin)

    _, finish = observer.events.last
    assert_equal(1, finish.retries)
    assert_same(result, finish.parsed)
    assert_same(attempts.last.timings, finish.timings)

    assert_requested(:any, /./, headers: {"x-observed-attempt" => "0"}, times: 1)
    assert_requested(:any, /./, headers: {"x-observed-attempt" => "1"}, times: 1)
  end

  def test_request_observer_status_error
    stub_request(:get, "http://localhost/v1/namespaces")
      .to_return_json(status: 500, body: {})
    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...", max_retries: 1)
    observer = RecordingObserver.new
    turbopuffer.request_observer = observer

    assert_raises(Turbopuffer::Errors::InternalServerError) do
      turbopuffer.namespaces
    end

    assert_equal(1, observer.events.count { _1.first == :finish })
    event, finish = observer.events.last
    assert_equal(:finish, event)
    assert_equal(1, finish.retries)
    assert_kind_of(Turbopuffer::Errors::InternalServerError, finish.error)
    assert_nil(finish.error_kind)
    assert_equal("500", finish.response.code)
    assert_nil(finish.parsed)
  end

  def test_request_observer_connection_error
    stub_request(:get, "http://localhost/v1/namespaces")
      .to_raise(Errno::ECONNREFUSED)
    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...", max_retries: 0)
    observer = RecordingObserver.new
    turbopuffer.request_observer = observer

    error = assert_raises(Turbopuffer::Errors::APIConnectionError) do
      turbopuffer.namespaces
    end

    assert_equal([:start, :attempt_begin, :attempt_end, :finish], observer.events.map(&:first))
    _, attempt = observer.events[2]
    assert_same(error, attempt.error)
    assert_equal(:connect_error, attempt.error_kind)
    assert_equal(false, attempt.reached_server)
    assert_nil(attempt.response)

    _, finish = observer.events.last
    assert_same(error, finish.error)
    assert_equal(:connect_error, finish.error_kind)
    assert_nil(finish.response)
  end

  def test_request_observer_timeout
    stub_request(:get, "http://localhost/v1/namespaces")
      .to_timeout
    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...", max_retries: 0)
    observer = RecordingObserver.new
    turbopuffer.request_observer = observer

    assert_raises(Turbopuffer::Errors::APITimeoutError) do
      turbopuffer.namespaces
    end

    _, attempt = observer.events[2]
    assert_equal(:connect_timeout, attempt.error_kind)
    assert_equal(false, attempt.reached_server)
    assert_equal(:connect_timeout, observer.events.last.last.error_kind)
  end

  def test_request_observer_error_kinds
    timings = Turbopuffer::Internal::Transport::RequestObserver::Timings.new
    timeout = Turbopuffer::Errors::APITimeoutError.new(url: URI("https://example.com"))

    # an SDK timeout without an underlying cause, such as from custom code
    assert_equal(:timeout, Turbopuffer::Internal::Transport::RequestObserver.error_kind(timeout, timings))
    assert_equal(
      :canceled,
      Turbopuffer::Internal::Transport::RequestObserver.error_kind(Interrupt.new, timings)
    )
    assert_equal(
      :other,
      Turbopuffer::Internal::Transport::RequestObserver.error_kind(ArgumentError.new, timings)
    )
  end

  def test_request_observer_errors_are_ignored
    stub_request(:get, "http://localhost/v1/namespaces")
      .to_return_json(status: 200, body: {})

    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...")
    turbopuffer.request_observer = RaisingObserver.new

    result = nil
    _, err = capture_io do
      result = turbopuffer.namespaces
    end

    refute_nil(result)
    assert_equal(3, err.scan("request observer raised").size)
  end

  def test_request_observer_not_observing
    stub_request(:get, "http://localhost/v1/namespaces")
      .to_return_json(status: 200, body: {})

    turbopuffer = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...")
    assert_nil(turbopuffer.request_observer)
    turbopuffer.namespaces

    observer = RecordingObserver.new(observe: false)
    turbopuffer.request_observer = observer
    turbopuffer.namespaces
    assert_equal([:start], observer.events.map(&:first))

    observer = RecordingObserver.new
    turbopuffer.request_observer = observer
    turbopuffer.request_observer = nil
    turbopuffer.namespaces
    assert_empty(observer.events)

    assert_requested(:any, /./, times: 3) do
      refute_includes(_1.headers.keys.map(&:downcase), "x-observed-attempt")
    end
  end
end
