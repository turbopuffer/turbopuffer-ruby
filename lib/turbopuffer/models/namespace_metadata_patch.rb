# frozen_string_literal: true

module Turbopuffer
  module Models
    class NamespaceMetadataPatch < Turbopuffer::Internal::Type::BaseModel
      # @!attribute pinning
      #   Configuration for namespace pinning.
      #
      #   - Missing field: no change to pinning configuration
      #   - `null` or `false`: explicitly remove pinning
      #   - `true`: enable pinning with default configuration
      #   - Object: set pinning configuration
      #
      #   @return [Boolean, Turbopuffer::Models::PinningConfig, nil]
      optional :pinning, union: -> { Turbopuffer::NamespaceMetadataPatch::Pinning }, nil?: true

      # @!method initialize(pinning: nil)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::NamespaceMetadataPatch} for more details.
      #
      #   Request to update namespace metadata configuration.
      #
      #   @param pinning [Boolean, Turbopuffer::Models::PinningConfig, nil] Configuration for namespace pinning.

      # Configuration for namespace pinning.
      #
      # - Missing field: no change to pinning configuration
      # - `null` or `false`: explicitly remove pinning
      # - `true`: enable pinning with default configuration
      # - Object: set pinning configuration
      #
      # @see Turbopuffer::Models::NamespaceMetadataPatch#pinning
      module Pinning
        extend Turbopuffer::Internal::Type::Union

        variant Turbopuffer::Internal::Type::Boolean

        # Configuration for namespace pinning.
        variant -> { Turbopuffer::PinningConfig }

        # @!method self.variants
        #   @return [Array(Boolean, Turbopuffer::Models::PinningConfig)]
      end
    end
  end
end
