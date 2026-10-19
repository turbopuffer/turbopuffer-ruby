# frozen_string_literal: true

require "minitest/mock"

require_relative "test_helper"

module Turbopuffer::Test::TelemetryHelpers
  Telemetry = Turbopuffer::Internal::Telemetry

  QUERY_PATH = "/v2/namespaces/my-ns/query"
  QUERY_ROUTE = "POST /v2/namespaces/{ns}/query"
  QUERY_BODY = {
    rows: [],
    performance: {
      approx_namespace_size: 1,
      cache_hit_ratio: 1.0,
      cache_temperature: "hot",
      exhaustive_search_count: 0,
      query_execution_ms: 5,
      server_total_ms: 7
    }
  }.freeze

  def take_payload(buffer)
    batch = buffer.take
    refute_nil(batch)
    JSON.parse(batch.header, symbolize_names: true)
  end

  def json_response(body, status: 200, headers: {})
    {status: status, headers: {"content-type" => "application/json", **headers}, body: JSON.generate(body)}
  end

  def add_record(buffer, status: 200)
    buffer.record(method: :post, url: QUERY_PATH, status: status, retries: 0, durations: {total: 5_000_000})
  end
end

class Turbopuffer::Test::TelemetryTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API
  include Turbopuffer::Test::TelemetryHelpers

  BASE_URL = "http://localhost"
  POLL_URL = "#{BASE_URL}/v1/namespaces/my-ns/operations/op-abc".freeze

  class Interrupted < Exception # rubocop:disable Lint/InheritException
  end

  def before_all
    super
    WebMock.enable!
  end

  def setup
    super
    Thread.current.thread_variable_set(:mock_sleep, [])
    @env = ENV.to_h
    ENV.delete(Telemetry::ENV_VAR)
    # Clients with the same key share a buffer, so each test gets its own.
    @api_key = "tpuf_#{SecureRandom.hex(8)}"
    @requests = []
  end

  def teardown
    ENV.replace(@env)
    Thread.current.thread_variable_set(:mock_sleep, nil)
    WebMock.reset!
    super
  end

  def after_all
    WebMock.disable!
    super
  end

  def new_client(**options)
    Turbopuffer::Client.new(base_url: BASE_URL, api_key: @api_key, telemetry: true, **options)
  end

  def buffer_of(client) = client.request_observer.buffer

  def query_response(headers: {}) = json_response(QUERY_BODY, headers: headers)

  # Serves responses in turn, repeating the last, and raising exceptions.
  def serve(method, url, *responses)
    stub_request(method, url).to_return do |request|
      @requests << request
      response = responses.length > 1 ? responses.shift : responses.first
      raise response unless response.is_a?(Hash)
      response
    end
  end

  def sent_records(request)
    value = request.headers["X-Turbopuffer-Client-Telemetry"]
    return nil if value.nil?
    payload = JSON.parse(value, symbolize_names: true)
    assert_equal(1, payload.fetch(:version))
    payload.fetch(:records)
  end

  def test_disabled_by_default
    refute(Telemetry.resolve_enabled(nil))
    assert_nil(Turbopuffer::Client.new(base_url: BASE_URL, api_key: @api_key).request_observer)
  end

  def test_env_var
    {"1" => true, "true" => true, " ON " => true, "yes" => true, "0" => false, "false" => false, "" => false}
      .each do |value, expected|
        ENV[Telemetry::ENV_VAR] = value
        assert_equal(expected, Telemetry.resolve_enabled(nil), value)
      end
  end

  def test_env_var_enables_client
    ENV[Telemetry::ENV_VAR] = "1"
    assert_kind_of(
      Telemetry::Observer,
      Turbopuffer::Client.new(base_url: BASE_URL, api_key: @api_key).request_observer
    )
  end

  def test_invalid_env_var_warns_and_disables
    ENV[Telemetry::ENV_VAR] = "sometimes"
    _, err = capture_io { refute(Telemetry.resolve_enabled(nil)) }
    assert_includes(err, Telemetry::ENV_VAR)
  end

  def test_explicit_value_beats_env_var
    ENV[Telemetry::ENV_VAR] = "1"
    refute(Telemetry.resolve_enabled(false))
    assert_nil(new_client(telemetry: false).request_observer)
    ENV[Telemetry::ENV_VAR] = "0"
    assert(Telemetry.resolve_enabled(true))
  end

  def test_route_template
    [
      [:post, "/v2/namespaces/my-ns/query", QUERY_ROUTE],
      [
        :post,
        "/v2/namespaces/my-ns/query?stainless_overload=multiQuery",
        "POST /v2/namespaces/{ns}/query?stainless_overload=multiQuery"
      ],
      [:post, "/v2/namespaces/my%2Fns", "POST /v2/namespaces/{ns}"],
      [:get, "/v1/namespaces", "GET /v1/namespaces"],
      [
        :get,
        "/v1/namespaces/my-ns/operations/abc123?stainless_overload=pollCopyFrom",
        "GET /v1/namespaces/{ns}/operations/{token}?stainless_overload=pollCopyFrom"
      ],
      [
        :get,
        URI("https://gcp-us-central1.turbopuffer.com/v1/namespaces/my-ns/metadata"),
        "GET /v1/namespaces/{ns}/metadata"
      ],
      [
        :post,
        "https://gcp-us-central1.turbopuffer.com/v2/namespaces/my-ns?stainless_overload=copyFrom",
        "POST /v2/namespaces/{ns}?stainless_overload=copyFrom"
      ]
    ].each do |method, url, expected|
      assert_equal(expected, Telemetry.route_template(method, url))
    end
  end

  def test_durations
    timings = Turbopuffer::Internal::Transport::RequestObserver::Timings.new
    timings.attempt_begin = 0
    timings.request_ready = 50
    timings.connect_begin = 150
    timings.connect_end = 400
    timings.send_begin = 410
    timings.send_end = 500
    timings.response_headers = 900
    timings.body_end = 950
    timings.extra[:compress_begin] = 60
    timings.extra[:compress_end] = 100
    assert_equal(
      {total: 1000, compress: 40, pool: 50, connect: 250, send: 90, wait: 400, body_read: 50},
      Telemetry.compute_durations(timings, 1000)
    )

    reused = Turbopuffer::Internal::Transport::RequestObserver::Timings.new
    reused.attempt_begin = 0
    reused.request_ready = 100
    reused.send_begin = 130
    reused.send_end = 350
    reused.response_headers = 300
    durations = Telemetry.compute_durations(reused, 400)
    refute_includes(durations, :connect)
    assert_equal(30, durations.fetch(:pool))
    assert_equal(0, durations.fetch(:wait))

    # Untraced phases are left out.
    untraced = Turbopuffer::Internal::Transport::RequestObserver::Timings.new
    untraced.attempt_begin = 0
    assert_equal({total: 400}, Telemetry.compute_durations(untraced, 400))
  end

  def test_records_are_taken_when_the_first_attempt_begins
    buffer = Telemetry::Buffer.new
    add_record(buffer)
    info = Turbopuffer::Internal::Transport::RequestObserver::RequestInfo.new(method: :post, url: QUERY_PATH)
    scope = Telemetry::Observer.new(buffer).start(info)

    # A request that fails before it's sent never takes them.
    refute_nil(buffer.take&.tap { buffer.restore(_1) })

    request = {headers: {}}
    scope.attempt_begin(0, request)
    refute_nil(request.fetch(:headers)[Telemetry::HEADER])
    assert_nil(buffer.take)
  end

  def test_durations_are_integer_microseconds
    buffer = Telemetry::Buffer.new
    buffer.record(
      method: :post,
      url: QUERY_PATH,
      status: 200,
      retries: 2,
      durations: {total: 1_234_567, compress: 0, deserialize: 999},
      server_total_ms: 7
    )

    record, = take_payload(buffer).fetch(:records)
    assert_equal(1234, record.fetch(:total_us))
    assert_equal(0, record.fetch(:deserialize_us))
    assert_equal(7000, record.fetch(:server_total_us))
    assert_equal(2, record.fetch(:retries))
    # A zero compress duration means the body wasn't compressed.
    refute_includes(record, :compress_us)
  end

  def test_full_buffer_drops_oldest_records
    buffer = Telemetry::Buffer.new
    (Telemetry::MAX_BUFFERED_RECORDS + 5).times { add_record(buffer, status: _1) }

    first = take_payload(buffer)
    assert_equal(5, first.fetch(:dropped))
    assert_equal(Telemetry::MAX_RECORDS_PER_HEADER, first.fetch(:records).length)
    assert_equal(5, first.fetch(:records).first.fetch(:status))

    second = take_payload(buffer)
    refute_includes(second, :dropped)
    assert_equal(5 + Telemetry::MAX_RECORDS_PER_HEADER, second.fetch(:records).first.fetch(:status))
  end

  def test_restore_puts_records_back_in_order
    buffer = Telemetry::Buffer.new
    3.times { add_record(buffer, status: _1) }
    batch = buffer.take

    add_record(buffer, status: 99)
    buffer.restore(batch)

    assert_equal([0, 1, 2, 99], take_payload(buffer).fetch(:records).map { _1.fetch(:status) })
  end

  def test_restore_drops_oldest_when_full
    buffer = Telemetry::Buffer.new
    Telemetry::MAX_RECORDS_PER_HEADER.times { add_record(buffer, status: _1) }
    batch = buffer.take
    (Telemetry::MAX_BUFFERED_RECORDS - 5).times { add_record(buffer, status: 1000) }

    buffer.restore(batch)

    payload = take_payload(buffer)
    assert_equal(Telemetry::MAX_RECORDS_PER_HEADER - 5, payload.fetch(:dropped))
    assert_equal(Telemetry::MAX_RECORDS_PER_HEADER - 5, payload.fetch(:records).first.fetch(:status))
  end

  def test_invalid_sample_rate_is_ignored
    ["abc", "1.5", "-0.1", "nan", ""].each do |value|
      buffer = Telemetry::Buffer.new
      [0.5, value].each do |rate|
        response = Net::HTTPOK.new("1.1", "200", "OK")
        response[Telemetry::SAMPLE_RATE_HEADER] = rate.to_s
        buffer.observe_response(response)
      end
      assert_equal(0.5, buffer.sample_rate, value)
    end
  end

  def test_fork_resets_buffers
    skip("fork is unsupported") unless Process.respond_to?(:fork)

    buffer = Telemetry.buffer_for(true, @api_key, BASE_URL)
    add_record(buffer)
    # Skips at_exit hooks, which would run the test suite again.
    pid = Process.fork { exit!(buffer.take.nil? ? 0 : 1) }
    Process.wait(pid)

    assert_predicate(Process.last_status, :success?)
    refute_nil(buffer.take)
  end

  def test_fork_replaces_held_locks
    buffer = Telemetry.buffer_for(true, @api_key, BASE_URL)
    add_record(buffer)
    # Simulates another thread holding the lock when the process forked.
    buffer.instance_variable_get(:@lock).lock

    Telemetry.after_fork_in_child

    assert_nil(buffer.take)
    add_record(buffer)
    refute_nil(buffer.take)
  end

  def test_clients_share_buffer_for_same_key_and_url
    client = new_client
    buffer = buffer_of(client)

    assert_same(buffer, buffer_of(new_client))
    refute_same(buffer, buffer_of(new_client(api_key: "tpuf_other")))
    refute_same(buffer, buffer_of(new_client(base_url: "http://127.0.0.1:4011")))

    # Copies keep the resolved setting instead of reading the env var again.
    ENV[Telemetry::ENV_VAR] = "0"
    assert_same(buffer, buffer_of(client.namespace("my-ns").instance_variable_get(:@client)))
  end

  def test_records_ride_on_next_request
    serve(:post, "#{BASE_URL}#{QUERY_PATH}", query_response)
    ns = new_client.namespace("my-ns")

    ns.query(top_k: 1)
    assert_nil(sent_records(@requests[0]))

    ns.query(top_k: 1)
    record, *rest = sent_records(@requests[1])
    assert_empty(rest)
    assert_equal(QUERY_ROUTE, record.fetch(:route))
    assert_equal(200, record.fetch(:status))
    assert_equal(7000, record.fetch(:server_total_us))
    # Mocked requests never open connections, so network phases are only covered by the local server test.
    [:total_us, :serialize_us, :deserialize_us, :age_ms].each do |key|
      assert_operator(record.fetch(key), :>=, 0, key)
    end
    assert_operator(record.fetch(:total_us), :>=, record.fetch(:serialize_us) + record.fetch(:deserialize_us))
    [:compress_us, :response_us, :retries, :error, :sample_rate].each { refute_includes(record, _1) }
  end

  def test_disabled_client_sends_nothing
    serve(:post, "#{BASE_URL}#{QUERY_PATH}", query_response)
    ns = Turbopuffer::Client.new(base_url: BASE_URL, api_key: @api_key).namespace("my-ns")

    ns.query(top_k: 1)
    ns.query(top_k: 1)

    assert_equal(2, @requests.length)
    @requests.each { assert_nil(sent_records(_1)) }
  end

  def test_server_sample_rate_of_zero_stops_recording
    serve(:post, "#{BASE_URL}#{QUERY_PATH}", query_response(headers: {Telemetry::SAMPLE_RATE_HEADER => "0"}))
    client = new_client

    3.times { client.namespace("my-ns").query(top_k: 1) }

    @requests.each { assert_nil(sent_records(_1)) }
    assert_equal(0.0, buffer_of(client).sample_rate)
  end

  def test_server_sample_rate_is_applied
    serve(
      :post,
      "#{BASE_URL}#{QUERY_PATH}",
      query_response(headers: {Telemetry::SAMPLE_RATE_HEADER => "0.25"})
    )
    ns = new_client.namespace("my-ns")

    Telemetry.stub(:random, 0.2) { ns.query(top_k: 1) }
    Telemetry.stub(:random, 0.3) do
      ns.query(top_k: 1)
      ns.query(top_k: 1)
    end

    assert_equal(0.25, sent_records(@requests[1]).first.fetch(:sample_rate))
    assert_nil(sent_records(@requests[2]))
  end

  def test_batch_is_resent_after_connect_error
    serve(:post, "#{BASE_URL}#{QUERY_PATH}", query_response, Errno::ECONNREFUSED, query_response)
    ns = new_client.namespace("my-ns")

    ns.query(top_k: 1)
    ns.query(top_k: 1)

    first_attempt = sent_records(@requests[1])
    refute_nil(first_attempt)
    assert_equal(first_attempt, sent_records(@requests[2]))
  end

  def test_batch_is_not_resent_after_server_error
    serve(:post, "#{BASE_URL}#{QUERY_PATH}", query_response, {status: 503}, query_response)
    ns = new_client.namespace("my-ns")

    3.times { ns.query(top_k: 1) }

    refute_nil(sent_records(@requests[1]))
    assert_nil(sent_records(@requests[2]))
    # The retried query reports how many retries it took.
    assert_equal(1, sent_records(@requests[3]).first.fetch(:retries))
  end

  def test_interrupted_requests_are_recorded
    serve(:post, "#{BASE_URL}#{QUERY_PATH}", Interrupted)
    ns = new_client.namespace("my-ns")

    assert_raises(Interrupted) { ns.query(top_k: 1) }
    serve(:post, "#{BASE_URL}#{QUERY_PATH}", query_response)
    ns.query(top_k: 1)

    assert_equal([[0, "canceled"]], sent_records(@requests.last).map { _1.values_at(:status, :error) })
  end

  def test_parse_failures_are_recorded
    not_json = {status: 200, headers: {"content-type" => "application/json"}, body: "not json"}
    serve(:post, "#{BASE_URL}#{QUERY_PATH}", not_json, query_response)
    ns = new_client(max_retries: 0).namespace("my-ns")

    assert_raises(JSON::ParserError) { ns.query(top_k: 1) }
    ns.query(top_k: 1)

    assert_equal([[200, "other"]], sent_records(@requests[1]).map { _1.values_at(:status, :error) })
  end

  def test_failures_are_recorded
    serve(
      :post,
      "#{BASE_URL}#{QUERY_PATH}",
      Net::ReadTimeout,
      Errno::ECONNREFUSED,
      json_response({error: "bad request"}, status: 400),
      query_response
    )
    ns = new_client(max_retries: 0).namespace("my-ns")

    assert_raises(Turbopuffer::Errors::APITimeoutError) { ns.query(top_k: 1) }
    assert_raises(Turbopuffer::Errors::APIConnectionError) { ns.query(top_k: 1) }
    assert_raises(Turbopuffer::Errors::BadRequestError) { ns.query(top_k: 1) }
    ns.query(top_k: 1)

    assert_nil(sent_records(@requests[0]))
    assert_equal([[0, "timeout"]], sent_records(@requests[1]).map { _1.values_at(:status, :error) })
    # The connect error never reached the server, so its batch is sent again with the new record.
    assert_equal(
      [[0, "timeout"], [0, "connect"]],
      sent_records(@requests[2]).map { _1.values_at(:status, :error) }
    )
    record, = sent_records(@requests[3])
    assert_equal(400, record.fetch(:status))
    refute_includes(record, :error)
  end

  def test_query_params_are_not_recorded
    serve(:get, %r{\A#{BASE_URL}/v1/namespaces}, json_response({namespaces: []}))
    client = new_client

    client.namespaces(prefix: "secret-prefix")

    record, = take_payload(buffer_of(client)).fetch(:records)
    assert_equal("GET /v1/namespaces", record.fetch(:route))
  end

  def test_overload_param_is_recorded
    serve(:post, "#{BASE_URL}#{QUERY_PATH}?stainless_overload=multiQuery", json_response({results: []}))
    client = new_client

    client.namespace("my-ns").multi_query(queries: [{top_k: 1}])

    record, = take_payload(buffer_of(client)).fetch(:records)
    assert_equal("POST /v2/namespaces/{ns}/query?stainless_overload=multiQuery", record.fetch(:route))
  end

  # Requests the server accepts with a 202 and the SDK then polls until they finish.
  def accept_write
    serve(
      :post,
      "#{BASE_URL}/v2/namespaces/my-ns",
      {status: 202, headers: {"preference-applied" => "respond-async", "location" => POLL_URL}}
    )
  end

  def write(client)
    client.namespace("my-ns").write(upsert_columns: {id: [1], vector: [[0.1]]})
  end

  # Returns the records sent on later requests, followed by those still buffered.
  def all_records(client)
    sent = @requests.flat_map { sent_records(_1) || [] }
    buffered = []
    while (batch = buffer_of(client).take)
      buffered.concat(JSON.parse(batch.header, symbolize_names: true).fetch(:records))
    end
    sent + buffered
  end

  def test_respond_async_polls_and_request_are_recorded
    accept_write
    serve(
      :get,
      POLL_URL,
      json_response({status: "running"}),
      json_response({status: "finished", result: {success: {status: "OK"}}})
    )
    client = new_client

    write(client)

    *polls, request = all_records(client)
    assert_equal(
      [["GET /v1/namespaces/{ns}/operations/{token}", 200]] * 2,
      polls.map { _1.values_at(:route, :status) }
    )
    # The request reports the final outcome, and its total spans the polling.
    assert_equal(["POST /v2/namespaces/{ns}", 200], request.values_at(:route, :status))
    refute_includes(request, :error)
    assert_operator(request.fetch(:total_us), :>=, polls.sum { _1.fetch(:total_us) })
  end

  def test_respond_async_failed_operation_is_recorded
    accept_write
    serve(
      :get,
      POLL_URL,
      json_response({status: "finished", result: {error: {status_code: 404, detail: {error: "gone"}}}})
    )
    client = new_client

    assert_raises(Turbopuffer::Errors::NotFoundError) { write(client) }

    _poll, request = all_records(client)
    assert_equal(["POST /v2/namespaces/{ns}", 404], request.values_at(:route, :status))
    refute_includes(request, :error)
  end

  def test_respond_async_polling_timeout_is_recorded
    accept_write
    serve(:get, POLL_URL, json_response({status: "running"}))
    client = new_client(timeout: 0.1)

    assert_raises(Turbopuffer::Errors::APITimeoutError) { write(client) }

    *_polls, request = all_records(client)
    assert_equal(["POST /v2/namespaces/{ns}", 202, "timeout"], request.values_at(:route, :status, :error))
  end
end

class Turbopuffer::Test::TelemetryConnectionTest < Minitest::Test
  extend Minitest::Serial
  include Turbopuffer::Test::TelemetryHelpers

  # A real server, since mocked requests never open connections to trace.
  def with_local_server
    server = TCPServer.new("127.0.0.1", 0)
    connections = []
    acceptor = Thread.new do
      loop { connections << Thread.new(server.accept) { serve_connection(_1) } }
    rescue IOError, SystemCallError
      nil
    end
    yield("http://127.0.0.1:#{server.addr[1]}")
  ensure
    server&.close
    acceptor&.join
    connections&.each(&:kill)
  end

  # Keeps connections open between requests, so they can be reused.
  def serve_connection(socket)
    while socket.gets
      length = 0
      while (line = socket.gets) && line != "\r\n"
        name, value = line.split(":", 2)
        length = value.to_i if name.casecmp?("content-length")
      end
      socket.read(length)
      body = JSON.generate(QUERY_BODY)
      socket.write(
        "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\nContent-Length: #{body.bytesize}\r\n\r\n#{body}"
      )
    end
  ensure
    socket.close
  end

  def test_connection_phases
    WebMock.disable!
    first, second = with_local_server do |base_url|
      client = Turbopuffer::Client.new(
        base_url: base_url,
        api_key: "tpuf_#{SecureRandom.hex(8)}",
        telemetry: true
      )
      buffer = client.request_observer.buffer
      ns = client.namespace("my-ns")

      Array.new(2) do
        ns.query(top_k: 1)
        take_payload(buffer).fetch(:records) => [record]
        record
      end
    end

    assert_equal(false, first.fetch(:reused))
    assert_includes(first, :connect_us)
    assert_equal(true, second.fetch(:reused))
    refute_includes(second, :connect_us)
    [first, second].each do |record|
      [:pool_us, :send_us, :wait_us, :body_read_us].each do |key|
        assert_operator(record.fetch(key), :>=, 0, key)
      end
      assert_operator(record.fetch(:wait_us) + record.fetch(:body_read_us), :<=, record.fetch(:total_us))
    end
  end
end
