# frozen_string_literal: true

module Turbopuffer
  module Models
    # The namespace to create an instant, copy-on-write clone of.
    module BranchFromNamespaceParams
      extend Turbopuffer::Internal::Type::Union

      # The namespace to create an instant, copy-on-write clone of.
      variant String

      variant -> { Turbopuffer::BranchFromNamespaceParams::BranchFromNamespaceConfig }

      class BranchFromNamespaceConfig < Turbopuffer::Internal::Type::BaseModel
        # @!attribute source_namespace
        #   The namespace to create an instant, copy-on-write clone of.
        #
        #   @return [String]
        required :source_namespace, String

        # @!method initialize(source_namespace:)
        #   @param source_namespace [String] The namespace to create an instant, copy-on-write clone of.
      end

      # @!method self.variants
      #   @return [Array(String, Turbopuffer::Models::BranchFromNamespaceParams::BranchFromNamespaceConfig)]
    end
  end
end
