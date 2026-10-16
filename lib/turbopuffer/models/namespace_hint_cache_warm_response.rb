# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#hint_cache_warm
    class NamespaceHintCacheWarmResponse < Turbopuffer::Internal::Type::BaseModel
      # @!attribute status
      #   The status of the request.
      #
      #   @return [Symbol, :ACCEPTED]
      required :status, const: :ACCEPTED

      # @!attribute message
      #   A message describing the result of the request.
      #
      #   @return [String, nil]
      optional :message, String

      # @!method initialize(message: nil, status: :ACCEPTED)
      #   The response to a successful cache warm request.
      #
      #   @param message [String] A message describing the result of the request.
      #
      #   @param status [Symbol, :ACCEPTED] The status of the request.
    end
  end
end
