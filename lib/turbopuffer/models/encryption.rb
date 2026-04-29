# frozen_string_literal: true

module Turbopuffer
  module Models
    # The encryption configuration for a namespace.
    module Encryption
      extend Turbopuffer::Internal::Type::Union

      # Encrypt the namespace with a customer-managed encryption key (CMEK).
      variant -> { Turbopuffer::Encryption::CustomerManaged }

      # Use the default server-side encryption (SSE).
      variant -> { Turbopuffer::Encryption::Default }

      class CustomerManaged < Turbopuffer::Internal::Type::BaseModel
        # @!attribute key_name
        #   The identifier of the CMEK key to use for encryption. For GCP, the
        #   fully-qualified resource name of the key. For AWS, the ARN of the key.
        #
        #   @return [String]
        required :key_name, String

        # @!attribute mode
        #
        #   @return [Symbol, :"customer-managed"]
        required :mode, const: :"customer-managed"

        # @!method initialize(key_name:, mode: :"customer-managed")
        #   Some parameter documentations has been truncated, see
        #   {Turbopuffer::Models::Encryption::CustomerManaged} for more details.
        #
        #   Encrypt the namespace with a customer-managed encryption key (CMEK).
        #
        #   @param key_name [String] The identifier of the CMEK key to use for encryption. For GCP, the fully-qualifi
        #
        #   @param mode [Symbol, :"customer-managed"]
      end

      class Default < Turbopuffer::Internal::Type::BaseModel
        # @!attribute mode
        #
        #   @return [Symbol, :default]
        required :mode, const: :default

        # @!method initialize(mode: :default)
        #   Use the default server-side encryption (SSE).
        #
        #   @param mode [Symbol, :default]
      end

      # @!method self.variants
      #   @return [Array(Turbopuffer::Models::Encryption::CustomerManaged, Turbopuffer::Models::Encryption::Default)]
    end
  end
end
