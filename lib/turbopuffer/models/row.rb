# frozen_string_literal: true

module Turbopuffer
  module Models
    class Row < Turbopuffer::Internal::Type::BaseModel
      # @!attribute id
      #   An identifier for a document.
      #
      #   @return [String, Integer]
      required :id, union: -> { Turbopuffer::ID }

      # @!attribute vector
      #   A vector embedding associated with a document.
      #
      #   @return [Array<Float>, String, nil]
      optional :vector, union: -> { Turbopuffer::Vector }

      # @!method initialize(id:, vector: nil)
      #   A single document, in a row-based format.
      #
      #   @param id [String, Integer] An identifier for a document.
      #
      #   @param vector [Array<Float>, String] A vector embedding associated with a document.

      def method_missing(name, *args, &block)
        if @data.key?(name)
          @data[name]
        else
          super
        end
      end

      def respond_to_missing?(name, include_private = false)
        @data.key?(name) || super
      end

      def []=(key, value)
        unless key.instance_of?(Symbol)
          raise ArgumentError.new("Expected symbol key for set, got #{key.inspect}")
        end

        @data[key] = value
      end
    end
  end
end
