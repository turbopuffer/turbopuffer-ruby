# typed: strong

module Turbopuffer
  module Models
    class NamespaceUpdateSchemaParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::NamespaceUpdateSchemaParams,
            Turbopuffer::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :namespace

      sig { params(namespace: String).void }
      attr_writer :namespace

      # The desired schema for the namespace.
      sig do
        returns(
          T.nilable(
            T::Hash[Symbol, T.any(String, Turbopuffer::AttributeSchemaConfig)]
          )
        )
      end
      attr_reader :schema

      sig do
        params(
          schema:
            T::Hash[
              Symbol,
              T.any(String, Turbopuffer::AttributeSchemaConfig::OrHash)
            ]
        ).void
      end
      attr_writer :schema

      sig do
        params(
          namespace: String,
          schema:
            T::Hash[
              Symbol,
              T.any(String, Turbopuffer::AttributeSchemaConfig::OrHash)
            ],
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        namespace: nil,
        # The desired schema for the namespace.
        schema: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            namespace: String,
            schema:
              T::Hash[
                Symbol,
                T.any(String, Turbopuffer::AttributeSchemaConfig)
              ],
            request_options: Turbopuffer::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
