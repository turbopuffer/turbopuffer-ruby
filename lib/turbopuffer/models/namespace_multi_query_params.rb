# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#multi_query
    class NamespaceMultiQueryParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      # @!attribute namespace
      #
      #   @return [String]
      required :namespace, String

      # @!attribute queries
      #
      #   @return [Array<Turbopuffer::Models::Query>]
      required :queries, -> { Turbopuffer::Internal::Type::ArrayOf[Turbopuffer::Query] }

      # @!attribute consistency
      #   The consistency level for a query.
      #
      #   @return [Turbopuffer::Models::NamespaceMultiQueryParams::Consistency, nil]
      optional :consistency, -> { Turbopuffer::NamespaceMultiQueryParams::Consistency }

      # @!attribute vector_encoding
      #   The encoding to use for vectors in the response.
      #
      #   @return [Symbol, Turbopuffer::Models::VectorEncoding, nil]
      optional :vector_encoding, enum: -> { Turbopuffer::VectorEncoding }

      # @!method initialize(namespace:, queries:, consistency: nil, vector_encoding: nil, request_options: {})
      #   @param namespace [String]
      #
      #   @param queries [Array<Turbopuffer::Models::Query>]
      #
      #   @param consistency [Turbopuffer::Models::NamespaceMultiQueryParams::Consistency] The consistency level for a query.
      #
      #   @param vector_encoding [Symbol, Turbopuffer::Models::VectorEncoding] The encoding to use for vectors in the response.
      #
      #   @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}]

      class Consistency < Turbopuffer::Internal::Type::BaseModel
        # @!attribute level
        #   The query's consistency level.
        #
        #   @return [Symbol, Turbopuffer::Models::NamespaceMultiQueryParams::Consistency::Level, nil]
        optional :level, enum: -> { Turbopuffer::NamespaceMultiQueryParams::Consistency::Level }

        # @!method initialize(level: nil)
        #   The consistency level for a query.
        #
        #   @param level [Symbol, Turbopuffer::Models::NamespaceMultiQueryParams::Consistency::Level] The query's consistency level.

        # The query's consistency level.
        #
        # @see Turbopuffer::Models::NamespaceMultiQueryParams::Consistency#level
        module Level
          extend Turbopuffer::Internal::Type::Enum

          # Strong consistency. Requires a round-trip to object storage to fetch the latest writes.
          STRONG = :strong

          # Eventual consistency. Does not require a round-trip to object storage, but may not see the latest writes.
          EVENTUAL = :eventual

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
