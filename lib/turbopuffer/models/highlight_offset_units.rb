# frozen_string_literal: true

module Turbopuffer
  module Models
    # The units to report highlighted fragment offsets in.
    module HighlightOffsetUnits
      extend Turbopuffer::Internal::Type::Enum

      UTF_8 = :"utf-8"
      UTF_16 = :"utf-16"
      CODEPOINTS = :codepoints

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
