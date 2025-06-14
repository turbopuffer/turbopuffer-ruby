# frozen_string_literal: true

module Turbopuffer
  module Models
    # An identifier for a document.
    module ID
      extend Turbopuffer::Internal::Type::Union

      # A UUID.
      variant String

      # An integer ID.
      variant Integer

      # @!method self.variants
      #   @return [Array(String, Integer)]
    end
  end
end
