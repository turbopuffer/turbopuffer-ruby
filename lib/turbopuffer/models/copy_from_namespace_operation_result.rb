# frozen_string_literal: true

module Turbopuffer
  module Models
    module CopyFromNamespaceOperationResult
      extend Turbopuffer::Internal::Type::Union

      variant -> { Turbopuffer::CopyFromNamespaceOperationResult::Success }

      variant -> { Turbopuffer::CopyFromNamespaceOperationResult::Error }

      class Success < Turbopuffer::Internal::Type::BaseModel
        # @!attribute success
        #   The response to a successful write request.
        #
        #   @return [Turbopuffer::Models::WriteResult]
        required :success, -> { Turbopuffer::WriteResult }

        # @!method initialize(success:)
        #   @param success [Turbopuffer::Models::WriteResult] The response to a successful write request.
      end

      class Error < Turbopuffer::Internal::Type::BaseModel
        # @!attribute error
        #
        #   @return [Turbopuffer::Models::OperationError]
        required :error, -> { Turbopuffer::OperationError }

        # @!method initialize(error:)
        #   @param error [Turbopuffer::Models::OperationError]
      end

      # @!method self.variants
      #   @return [Array(Turbopuffer::Models::CopyFromNamespaceOperationResult::Success, Turbopuffer::Models::CopyFromNamespaceOperationResult::Error)]
    end
  end
end
