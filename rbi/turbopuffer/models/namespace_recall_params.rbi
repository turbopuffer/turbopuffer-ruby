# typed: strong

module Turbopuffer
  module Models
    class NamespaceRecallParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::NamespaceRecallParams,
            Turbopuffer::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :namespace

      sig { params(namespace: String).void }
      attr_writer :namespace

      # Filter by attributes. Same syntax as the query endpoint.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :filters

      sig { params(filters: T.anything).void }
      attr_writer :filters

      # The number of searches to run.
      sig { returns(T.nilable(Integer)) }
      attr_reader :num

      sig { params(num: Integer).void }
      attr_writer :num

      # Use specific query vectors for the measurement. If omitted, sampled from the
      # index.
      sig { returns(T.nilable(T::Array[Float])) }
      attr_reader :queries

      sig { params(queries: T::Array[Float]).void }
      attr_writer :queries

      # Search for `top_k` nearest neighbors.
      sig { returns(T.nilable(Integer)) }
      attr_reader :top_k

      sig { params(top_k: Integer).void }
      attr_writer :top_k

      sig do
        params(
          namespace: String,
          filters: T.anything,
          num: Integer,
          queries: T::Array[Float],
          top_k: Integer,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        namespace: nil,
        # Filter by attributes. Same syntax as the query endpoint.
        filters: nil,
        # The number of searches to run.
        num: nil,
        # Use specific query vectors for the measurement. If omitted, sampled from the
        # index.
        queries: nil,
        # Search for `top_k` nearest neighbors.
        top_k: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            namespace: String,
            filters: T.anything,
            num: Integer,
            queries: T::Array[Float],
            top_k: Integer,
            request_options: Turbopuffer::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
