# frozen_string_literal: true

module Turbopuffer
  module Models
    class PinningConfig < Turbopuffer::Internal::Type::BaseModel
      # @!attribute replicas
      #   The number of read replicas to provision. Defaults to 1 if not specified.
      #
      #   @return [Integer, nil]
      optional :replicas, Integer

      # @!method initialize(replicas: nil)
      #   Configuration for namespace pinning.
      #
      #   @param replicas [Integer] The number of read replicas to provision. Defaults to 1 if not specified.
    end
  end
end
