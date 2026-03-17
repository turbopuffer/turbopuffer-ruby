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

      # The performance information for a write request.
      sig { params(server_total_ms: Integer).returns(T.attached_class) }
      def self.new(
        # Request time measured on the server, in milliseconds.
        server_total_ms:
      )
      end

      sig { override.returns({ server_total_ms: Integer }) }
      def to_hash
      end
    end
  end
end
