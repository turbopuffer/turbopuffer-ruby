# typed: strong

module Turbopuffer
  module Models
    class ClientNamespacesParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::ClientNamespacesParams,
            Turbopuffer::Internal::AnyHash
          )
        end

      # Retrieve the next page of results.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Limit the number of results per page.
      sig { returns(T.nilable(Integer)) }
      attr_reader :page_size

      sig { params(page_size: Integer).void }
      attr_writer :page_size

      # Retrieve only the namespaces that match the prefix.
      sig { returns(T.nilable(String)) }
      attr_reader :prefix

      sig { params(prefix: String).void }
      attr_writer :prefix

      sig do
        params(
          cursor: String,
          page_size: Integer,
          prefix: String,
          request_options: Turbopuffer::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Retrieve the next page of results.
        cursor: nil,
        # Limit the number of results per page.
        page_size: nil,
        # Retrieve only the namespaces that match the prefix.
        prefix: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            page_size: Integer,
            prefix: String,
            request_options: Turbopuffer::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
