# frozen_string_literal: true

module Turbopuffer
  module Models
    class ShardingConfig < Turbopuffer::Internal::Type::BaseModel
      # @!attribute num_shards
      #   The number of shards to partition the namespace into.
      #
      #   @return [Integer]
      required :num_shards, Integer

      # @!method initialize(num_shards:)
      #   Configuration for namespace sharding, which partitions a namespace's documents
      #   across multiple internal shards to scale indexing and query throughput beyond a
      #   single machine. Sharding can only be configured on a namespace's inaugural
      #   write, and cannot be added to or changed on an existing namespace.
      #
      #   @param num_shards [Integer] The number of shards to partition the namespace into.
    end
  end
end
