# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#poll_copy_from
    class NamespacePollCopyFromParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      # @!attribute namespace
      #
      #   @return [String, nil]
      optional :namespace, String

      # @!attribute token
      #
      #   @return [String]
      required :token, String

      # @!method initialize(token:, namespace: nil, request_options: {})
      #   @param token [String]
      #   @param namespace [String]
      #   @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
