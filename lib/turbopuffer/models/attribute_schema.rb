# frozen_string_literal: true

module Turbopuffer
  module Models
    # The schema for an attribute attached to a document.
    module AttributeSchema
      extend Turbopuffer::Internal::Type::Union

      # The data type of the attribute. Valid values: string, int, uint, uuid, datetime, bool, []string, []int, []uint, []uuid, []datetime, [DIMS]f16, [DIMS]f32.
      variant -> { Turbopuffer::AttributeType }

      # Detailed configuration for an attribute attached to a document.
      variant -> { Turbopuffer::AttributeSchemaConfig }

      # @!method self.variants
      #   @return [Array(String, Turbopuffer::Models::AttributeSchemaConfig)]
    end
  end
end
