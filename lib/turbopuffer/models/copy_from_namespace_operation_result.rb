# frozen_string_literal: true

module Turbopuffer
  module Models
    # The result of a finished copy operation.
    module CopyFromNamespaceOperationResult
      extend Turbopuffer::Internal::Type::Union

      variant -> { Turbopuffer::CopyFromNamespaceOperationResult::Success }

      variant -> { Turbopuffer::CopyFromNamespaceOperationResult::Error }

      class Success < Turbopuffer::Internal::Type::BaseModel
        # @!attribute success
        #   The copy succeeded, with the result of its write.
        #
        #   @return [Turbopuffer::Models::WriteResult]
        required :success, -> { Turbopuffer::WriteResult }

        # @!method initialize(success:)
        #   @param success [Turbopuffer::Models::WriteResult] The copy succeeded, with the result of its write.
      end

      class Error < Turbopuffer::Internal::Type::BaseModel
        # @!attribute error
        #   The copy failed, with its error.
        #
        #   @return [Turbopuffer::Models::OperationError]
        required :error, -> { Turbopuffer::OperationError }

        # @!method initialize(error:)
        #   @param error [Turbopuffer::Models::OperationError] The copy failed, with its error.
      end

      # @!method self.variants
      #   @return [Array(Turbopuffer::Models::CopyFromNamespaceOperationResult::Success, Turbopuffer::Models::CopyFromNamespaceOperationResult::Error)]
    end
  end
end
