# typed: strong

module Turbopuffer
  module Models
    class WritePerformance < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::WritePerformance, Turbopuffer::Internal::AnyHash)
        end

      # Request time measured on the server, in milliseconds.
      sig { returns(Integer) }
      attr_accessor :server_total_ms

      # Time spent embedding text, in milliseconds. Only set when using a native
      # embedding model.
      sig { returns(T.nilable(Integer)) }
      attr_reader :embedding_ms

      sig { params(embedding_ms: Integer).void }
      attr_writer :embedding_ms

      # The number of tokens embedded. Only set when using a native embedding model.
      sig { returns(T.nilable(Integer)) }
      attr_reader :embedding_tokens

      sig { params(embedding_tokens: Integer).void }
      attr_writer :embedding_tokens

      # The performance information for a write request.
      sig do
        params(
          server_total_ms: Integer,
          embedding_ms: Integer,
          embedding_tokens: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Request time measured on the server, in milliseconds.
        server_total_ms:,
        # Time spent embedding text, in milliseconds. Only set when using a native
        # embedding model.
        embedding_ms: nil,
        # The number of tokens embedded. Only set when using a native embedding model.
        embedding_tokens: nil
      )
      end

      sig do
        override.returns(
          {
            server_total_ms: Integer,
            embedding_ms: Integer,
            embedding_tokens: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
