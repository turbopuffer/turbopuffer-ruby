# frozen_string_literal: true

module Turbopuffer
  module Models
    # Describes the language of a text attribute. Defaults to `english`.
    module Language
      extend Turbopuffer::Internal::Type::Enum

      ARABIC = :arabic
      DANISH = :danish
      DUTCH = :dutch
      ENGLISH = :english
      FINNISH = :finnish
      FRENCH = :french
      GERMAN = :german
      GREEK = :greek
      HUNGARIAN = :hungarian
      ITALIAN = :italian
      NORWEGIAN = :norwegian
      PORTUGUESE = :portuguese
      ROMANIAN = :romanian
      RUSSIAN = :russian
      SPANISH = :spanish
      SWEDISH = :swedish
      TAMIL = :tamil
      TURKISH = :turkish

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
