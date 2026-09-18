# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#start_copy_from
    class NamespaceStartCopyFromResponse < Turbopuffer::Internal::Type::BaseModel
      # @!attribute token
      #   The token identifying the copy operation.
      #
      #   @return [String]
      required :token, String

      # @!method initialize(token:)
      #   @param token [String] The token identifying the copy operation.
    end
  end
end
