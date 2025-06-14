# frozen_string_literal: true

module Turbopuffer
  module Models
    # The encoding to use for vectors in the response.
    module VectorEncoding
      extend Turbopuffer::Internal::Type::Enum

      FLOAT = :float
      BASE64 = :base64

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
