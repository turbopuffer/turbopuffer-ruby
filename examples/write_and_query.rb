#!/usr/bin/env ruby

# frozen_string_literal: true
# typed: strict

# A straightforward example of storing and retrieving documents via vector
# similarity search.
#
# Run this example with: bundle exec examples/write_and_query.rb

require "turbopuffer"

client = Turbopuffer::Client.new(region: "gcp-us-central1")

namespace = client.namespace("turbopuffer-ruby-write-and-query-test")
puts "Operating on namespace: #{namespace.id}"

# Delete the namespace if it already exists.
begin
  namespace.delete_all({})
rescue Turbopuffer::Errors::NotFoundError => e
  puts("Namespace not found, continuing")
end

# Upsert some documents.
upsert = namespace.write(
  upsert_rows: [
    {
      id: "b3ff34ea-87bb-469c-a854-9cb7e3713fc3",
      vector: [1.0, 2.0, 3.0],
      name: "Luke",
      age: 32
    },
    {
      id: "580d4471-9a9b-44fb-b59d-637ade604f72",
      vector: [4.0, 5.0, 6.0],
      name: "Leia",
      age: 28
    }
  ],
  distance_metric: Turbopuffer::DistanceMetric::COSINE_DISTANCE,
  schema: {
    id: "uuid",
    name: {type: "string", filterable: false},
    age: "uint"
  }
)
puts "Upsert status: #{upsert.status}"

# Do a vector query
query = namespace.query(
  rank_by: ["vector", "ANN", [3.0, 4.0, 5.0]],
  top_k: 10,
  include_attributes: true,
  filters: ["And", [["age", "Gt", 30], ["age", "Lt", 35]]]
)
puts "Query result:"
pp query.deep_to_h

# Print the schema
schema = namespace.schema({})
puts "Schema:"
pp schema

# Patch one document
patch = namespace.write(
  patch_rows: [
    {
      id: "580d4471-9a9b-44fb-b59d-637ade604f72",
      age: 82
    }
  ],
  distance_metric: "cosine_distance"
)
puts "Patch status: #{patch.status}"

# Do a non-vector query to see the patched results
query2 = namespace.query(
  rank_by: %w[id asc],
  top_k: 10,
  include_attributes: true
)
puts "Query result:"
pp query2.deep_to_h
