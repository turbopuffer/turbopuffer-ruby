# typed: strong

module Turbopuffer
  module Models
    class ShardingConfig < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::ShardingConfig, Turbopuffer::Internal::AnyHash)
        end

      # The number of shards to partition the namespace into.
      sig { returns(Integer) }
      attr_accessor :num_shards

      # Configuration for namespace sharding, which partitions a namespace's documents
      # across multiple internal shards to scale indexing and query throughput beyond a
      # single machine. Sharding can only be configured on a namespace's inaugural
      # write, and cannot be added to or changed on an existing namespace.
      sig { params(num_shards: Integer).returns(T.attached_class) }
      def self.new(
        # The number of shards to partition the namespace into.
        num_shards:
      )
      end

      sig { override.returns({ num_shards: Integer }) }
      def to_hash
      end
    end
  end
end
