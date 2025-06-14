# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Client#namespaces
    class ClientNamespacesParams < Turbopuffer::Internal::Type::BaseModel
      extend Turbopuffer::Internal::Type::RequestParameters::Converter
      include Turbopuffer::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Retrieve the next page of results.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute page_size
      #   Limit the number of results per page.
      #
      #   @return [Integer, nil]
      optional :page_size, Integer

      # @!attribute prefix
      #   Retrieve only the namespaces that match the prefix.
      #
      #   @return [String, nil]
      optional :prefix, String

      # @!method initialize(cursor: nil, page_size: nil, prefix: nil, request_options: {})
      #   @param cursor [String] Retrieve the next page of results.
      #
      #   @param page_size [Integer] Limit the number of results per page.
      #
      #   @param prefix [String] Retrieve only the namespaces that match the prefix.
      #
      #   @param request_options [Turbopuffer::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
