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

      # Include ground truth data (query vectors and true nearest neighbors) in the
      # response.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_ground_truth

      sig { params(include_ground_truth: T::Boolean).void }
      attr_writer :include_ground_truth

      # The number of searches to run.
      sig { returns(T.nilable(Integer)) }
      attr_reader :num

      sig { params(num: Integer).void }
      attr_writer :num

      # The ranking function to evaluate recall for. If provided, `num` must be either
      # null or 1.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :rank_by

      sig { params(rank_by: T.anything).void }
      attr_writer :rank_by

      # Search for `top_k` nearest neighbors.
      sig { returns(T.nilable(Integer)) }
      attr_reader :top_k

      sig { params(top_k: Integer).void }
      attr_writer :top_k

      sig do
        params(
          namespace: String,
          filters: T.anything,
          include_ground_truth: T::Boolean,
          num: Integer,
          rank_by: T.anything,
          top_k: Integer,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        namespace: nil,
        # Filter by attributes. Same syntax as the query endpoint.
        filters: nil,
        # Include ground truth data (query vectors and true nearest neighbors) in the
        # response.
        include_ground_truth: nil,
        # The number of searches to run.
        num: nil,
        # The ranking function to evaluate recall for. If provided, `num` must be either
        # null or 1.
        rank_by: nil,
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
            include_ground_truth: T::Boolean,
            num: Integer,
            rank_by: T.anything,
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
