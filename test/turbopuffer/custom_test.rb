# frozen_string_literal: true

require "securerandom"
require_relative "test_helper"

class Turbopuffer::Test::CustomTest < Minitest::Test
    def before_all
        super
        @turbopuffer = Turbopuffer::Client.new(region: "gcp-us-central1")
    end

    def setup
        super
        @ns = @turbopuffer.namespace("test-rb-#{SecureRandom.uuid}")
    end

    def test_smoke
        result = @ns.write(upsert_rows: [{id: 1, vector: [1, 2, 3]}])
        assert_equal(result.rows_affected, 1)
    end
end
