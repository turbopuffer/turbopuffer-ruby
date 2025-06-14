# frozen_string_literal: true

module Turbopuffer
  module Models
    # Whether to include attributes in the response.
    module IncludeAttributes
      extend Turbopuffer::Internal::Type::Union

      # When `true`, include all attributes in the response. When `false`, include no attributes in the response.
      variant Turbopuffer::Internal::Type::Boolean

      # Include exactly the specified attributes in the response.
      variant -> { Turbopuffer::Models::IncludeAttributes::StringArray }

      # @!method self.variants
      #   @return [Array(Boolean, Array<String>)]

      # @type [Turbopuffer::Internal::Type::Converter]
      StringArray = Turbopuffer::Internal::Type::ArrayOf[String]
    end
  end
end
