# frozen_string_literal: true

require_relative "test_helper"

class Turbopuffer::Test::RespondAsyncObserverTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  POLL_URL = "http://localhost/v1/namespaces/test/operations/op-abc"

  # Records every request that finishes, in order.
  class FinishRecorder < Turbopuffer::Internal::Transport::RequestObserver
    attr_reader :finished

    def initialize
      super
      @finished = []
    end

    def start(info) = Scope.new(self, info)

    class Scope < Turbopuffer::Internal::Transport::RequestObserver::RequestScope
      def initialize(recorder, info)
        super()
        @recorder = recorder
        @info = info
      end

      def finish(result) = @recorder.finished << [@info, result]
    end
  end

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

  def stub_accepted
    stub_request(:post, "http://localhost/v2/namespaces/test").to_return(
      status: 202,
      headers: {"preference-applied" => "respond-async", "location" => POLL_URL}
    )
  end

  def write(**client_options)
    @recorder = FinishRecorder.new
    client = Turbopuffer::Client.new(base_url: "http://localhost", api_key: "tpuf_A1...", **client_options)
    client.request_observer = @recorder
    client.namespace("test").write(upsert_columns: {id: [1], vector: [[0.1]]})
  end

  # Returns the results of the polls, and of the write, which finishes last.
  def observed
    *polls, (info, write) = @recorder.finished
    assert_equal(:post, info.method)
    [polls.map(&:last), write]
  end

  def test_polls_finish_before_the_write
    stub_accepted
    stub_request(:get, POLL_URL).to_return_json(
      [
        {status: 200, body: {status: "running"}},
        {status: 200, body: {status: "finished", result: {success: {status: "OK"}}}}
      ]
    )

    write

    poll_infos = @recorder.finished[0..-2].map(&:first)
    assert_equal([[:get, "/v1/namespaces/test/operations/op-abc"]] * 2, poll_infos.map { [_1.method, _1.url] })
    polls, write = observed
    polls.each do |poll|
      assert_nil(poll.error)
      assert_equal("200", poll.response.code)
      refute_nil(poll.parsed)
    end

    # The write ends with the polled result, and its body was read before polling began.
    assert_nil(write.error)
    assert_equal("200", write.response.code)
    refute_nil(write.parsed)
    assert_operator(write.timings.body_end, :<=, polls.first.timings.attempt_begin)
    assert_operator(write.timings.deserialize_end, :>=, polls.last.timings.deserialize_end)
  end

  def test_failed_operation_finishes_the_write
    stub_accepted
    stub_request(:get, POLL_URL).to_return_json(
      status: 200,
      body: {status: "finished", result: {error: {status_code: 404, detail: {message: "namespace not found"}}}}
    )

    err = assert_raises(Turbopuffer::Errors::NotFoundError) { write }

    _, write = observed
    assert_same(err, write.error)
    assert_nil(write.error_kind)
    assert_equal(404, write.error.status)
  end

  def test_polling_timeout_finishes_the_write
    stub_accepted
    stub_request(:get, POLL_URL).to_return_json(status: 200, body: {status: "running"})

    assert_raises(Turbopuffer::Errors::APITimeoutError) { write(timeout: 0.1) }

    _, write = observed
    assert_equal(:timeout, write.error_kind)
    assert_equal("202", write.response.code)
  end
end
