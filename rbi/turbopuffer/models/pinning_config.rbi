# typed: strong

module Turbopuffer
  module Models
    class PinningConfig < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::PinningConfig, Turbopuffer::Internal::AnyHash)
        end

      # The number of read replicas to provision. Defaults to 1 if not specified.
      sig { returns(T.nilable(Integer)) }
      attr_reader :replicas

      sig { params(replicas: Integer).void }
      attr_writer :replicas

      # Configuration for namespace pinning.
      sig { params(replicas: Integer).returns(T.attached_class) }
      def self.new(
        # The number of read replicas to provision. Defaults to 1 if not specified.
        replicas: nil
      )
      end

      sig { override.returns({ replicas: Integer }) }
      def to_hash
      end
    end
  end
end
