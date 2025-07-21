# typed: strong

module Turbopuffer
  module Models
    class NamespaceMultiQueryParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::NamespaceMultiQueryParams,
            Turbopuffer::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :namespace

      sig { params(namespace: String).void }
      attr_writer :namespace

      sig { returns(T::Array[Turbopuffer::Query]) }
      attr_accessor :queries

      # The consistency level for a query.
      sig do
        returns(T.nilable(Turbopuffer::NamespaceMultiQueryParams::Consistency))
      end
      attr_reader :consistency

      sig do
        params(
          consistency:
            Turbopuffer::NamespaceMultiQueryParams::Consistency::OrHash
        ).void
      end
      attr_writer :consistency

      # The encoding to use for vectors in the response.
      sig { returns(T.nilable(Turbopuffer::VectorEncoding::OrSymbol)) }
      attr_reader :vector_encoding

      sig do
        params(vector_encoding: Turbopuffer::VectorEncoding::OrSymbol).void
      end
      attr_writer :vector_encoding

      sig do
        params(
          queries: T::Array[Turbopuffer::Query::OrHash],
          namespace: String,
          consistency:
            Turbopuffer::NamespaceMultiQueryParams::Consistency::OrHash,
          vector_encoding: Turbopuffer::VectorEncoding::OrSymbol,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        queries:,
        namespace: nil,
        # The consistency level for a query.
        consistency: nil,
        # The encoding to use for vectors in the response.
        vector_encoding: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            namespace: String,
            queries: T::Array[Turbopuffer::Query],
            consistency: Turbopuffer::NamespaceMultiQueryParams::Consistency,
            vector_encoding: Turbopuffer::VectorEncoding::OrSymbol,
            request_options: Turbopuffer::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Consistency < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::NamespaceMultiQueryParams::Consistency,
              Turbopuffer::Internal::AnyHash
            )
          end

        # The query's consistency level.
        sig do
          returns(
            T.nilable(
              Turbopuffer::NamespaceMultiQueryParams::Consistency::Level::OrSymbol
            )
          )
        end
        attr_reader :level

        sig do
          params(
            level:
              Turbopuffer::NamespaceMultiQueryParams::Consistency::Level::OrSymbol
          ).void
        end
        attr_writer :level

        # The consistency level for a query.
        sig do
          params(
            level:
              Turbopuffer::NamespaceMultiQueryParams::Consistency::Level::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The query's consistency level.
          level: nil
        )
        end

        sig do
          override.returns(
            {
              level:
                Turbopuffer::NamespaceMultiQueryParams::Consistency::Level::OrSymbol
            }
          )
        end
        def to_hash
        end

        # The query's consistency level.
        module Level
          extend Turbopuffer::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Turbopuffer::NamespaceMultiQueryParams::Consistency::Level
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Strong consistency. Requires a round-trip to object storage to fetch the latest writes.
          STRONG =
            T.let(
              :strong,
              Turbopuffer::NamespaceMultiQueryParams::Consistency::Level::TaggedSymbol
            )

          # Eventual consistency. Does not require a round-trip to object storage, but may not see the latest writes.
          EVENTUAL =
            T.let(
              :eventual,
              Turbopuffer::NamespaceMultiQueryParams::Consistency::Level::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Turbopuffer::NamespaceMultiQueryParams::Consistency::Level::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
