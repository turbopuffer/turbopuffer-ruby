# typed: strong

module Turbopuffer
  module Models
    class NamespaceMetadataPatch < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::NamespaceMetadataPatch,
            Turbopuffer::Internal::AnyHash
          )
        end

      # Configuration for namespace pinning.
      #
      # - Missing field: no change to pinning configuration
      # - `null` or `false`: explicitly remove pinning
      # - `true`: enable pinning with default configuration
      # - Object: set pinning configuration
      sig { returns(T.nilable(T.any(T::Boolean, Turbopuffer::PinningConfig))) }
      attr_accessor :pinning

      # Set to `true` to reject document and schema writes, or `false` to allow them.
      # Writes already in progress may still commit. Metadata updates remain available.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :read_only

      sig { params(read_only: T::Boolean).void }
      attr_writer :read_only

      # Request to update namespace metadata configuration.
      sig do
        params(
          pinning:
            T.nilable(T.any(T::Boolean, Turbopuffer::PinningConfig::OrHash)),
          read_only: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Configuration for namespace pinning.
        #
        # - Missing field: no change to pinning configuration
        # - `null` or `false`: explicitly remove pinning
        # - `true`: enable pinning with default configuration
        # - Object: set pinning configuration
        pinning: nil,
        # Set to `true` to reject document and schema writes, or `false` to allow them.
        # Writes already in progress may still commit. Metadata updates remain available.
        read_only: nil
      )
      end

      sig do
        override.returns(
          {
            pinning: T.nilable(T.any(T::Boolean, Turbopuffer::PinningConfig)),
            read_only: T::Boolean
          }
        )
      end
      def to_hash
      end

      # Configuration for namespace pinning.
      #
      # - Missing field: no change to pinning configuration
      # - `null` or `false`: explicitly remove pinning
      # - `true`: enable pinning with default configuration
      # - Object: set pinning configuration
      module Pinning
        extend Turbopuffer::Internal::Type::Union

        Variants =
          T.type_alias { T.any(T::Boolean, Turbopuffer::PinningConfig) }

        sig do
          override.returns(
            T::Array[Turbopuffer::NamespaceMetadataPatch::Pinning::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
