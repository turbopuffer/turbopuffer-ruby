# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#hint_cache_warm
    class NamespaceHintCacheWarmResponse < Turbopuffer::Internal::Type::BaseModel
      # @!attribute status
      #   The status of the request.
      #
      #   @return [Symbol, :OK]
      required :status, const: :OK

      # @!attribute message
      #
      #   @return [String, nil]
      optional :message, String

      # @!method initialize(message: nil, status: :OK)
      #   The response to a successful cache warm request.
      #
      #   @param message [String]
      #
      #   @param status [Symbol, :OK] The status of the request.
    end
  end
end
