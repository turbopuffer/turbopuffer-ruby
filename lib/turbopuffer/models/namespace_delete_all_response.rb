# frozen_string_literal: true

module Turbopuffer
  module Models
    # @see Turbopuffer::Resources::Namespaces#delete_all
    class NamespaceDeleteAllResponse < Turbopuffer::Internal::Type::BaseModel
      # @!attribute status
      #   The status of the request.
      #
      #   @return [Symbol, :OK]
      required :status, const: :OK

      # @!method initialize(status: :OK)
      #   The response to a successful namespace deletion request.
      #
      #   @param status [Symbol, :OK] The status of the request.
    end
  end
end
