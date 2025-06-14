# typed: strong

module Turbopuffer
  module Models
    class NamespaceMultiQueryResponse < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::Models::NamespaceMultiQueryResponse,
            Turbopuffer::Internal::AnyHash
          )
        end

      # The billing information for a query.
      sig { returns(Turbopuffer::QueryBilling) }
      attr_reader :billing

      sig { params(billing: Turbopuffer::QueryBilling::OrHash).void }
      attr_writer :billing

      # The performance information for a query.
      sig { returns(Turbopuffer::QueryPerformance) }
      attr_reader :performance

      sig { params(performance: Turbopuffer::QueryPerformance::OrHash).void }
      attr_writer :performance

      sig do
        returns(
          T::Array[Turbopuffer::Models::NamespaceMultiQueryResponse::Result]
        )
      end
      attr_accessor :results

      # The result of a multi-query.
      sig do
        params(
          billing: Turbopuffer::QueryBilling::OrHash,
          performance: Turbopuffer::QueryPerformance::OrHash,
          results:
            T::Array[
              Turbopuffer::Models::NamespaceMultiQueryResponse::Result::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(
        # The billing information for a query.
        billing:,
        # The performance information for a query.
        performance:,
        results:
      )
      end

      sig do
        override.returns(
          {
            billing: Turbopuffer::QueryBilling,
            performance: Turbopuffer::QueryPerformance,
            results:
              T::Array[Turbopuffer::Models::NamespaceMultiQueryResponse::Result]
          }
        )
      end
      def to_hash
      end

      class Result < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::Models::NamespaceMultiQueryResponse::Result,
              Turbopuffer::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :aggregations

        sig { params(aggregations: T::Hash[Symbol, T.anything]).void }
        attr_writer :aggregations

        sig { returns(T.nilable(T::Array[Turbopuffer::Row])) }
        attr_reader :rows

        sig { params(rows: T::Array[Turbopuffer::Row::OrHash]).void }
        attr_writer :rows

        sig do
          params(
            aggregations: T::Hash[Symbol, T.anything],
            rows: T::Array[Turbopuffer::Row::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(aggregations: nil, rows: nil)
        end

        sig do
          override.returns(
            {
              aggregations: T::Hash[Symbol, T.anything],
              rows: T::Array[Turbopuffer::Row]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
