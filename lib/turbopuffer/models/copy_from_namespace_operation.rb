# frozen_string_literal: true

module Turbopuffer
  module Models
    # The current status of a copy operation.
    #
    # @see Turbopuffer::Resources::Namespaces#poll_copy_from
    module CopyFromNamespaceOperation
      extend Turbopuffer::Internal::Type::Union

      discriminator :status

      variant :running, -> { Turbopuffer::CopyFromNamespaceOperation::Running }

      variant :finished, -> { Turbopuffer::CopyFromNamespaceOperation::Finished }

      class Running < Turbopuffer::Internal::Type::BaseModel
        # @!attribute start_time
        #   The time at which the operation started.
        #
        #   @return [Time]
        required :start_time, Time

        # @!attribute status
        #
        #   @return [Symbol, :running]
        required :status, const: :running

        # @!attribute progress
        #   A freeform description of the operation's progress. May be absent, and its
        #   format may change.
        #
        #   @return [String, nil]
        optional :progress, String

        # @!method initialize(start_time:, progress: nil, status: :running)
        #   Some parameter documentations has been truncated, see
        #   {Turbopuffer::Models::CopyFromNamespaceOperation::Running} for more details.
        #
        #   @param start_time [Time] The time at which the operation started.
        #
        #   @param progress [String] A freeform description of the operation's progress. May be absent, and its forma
        #
        #   @param status [Symbol, :running]
      end

      class Finished < Turbopuffer::Internal::Type::BaseModel
        # @!attribute finish_time
        #   The time at which the operation finished.
        #
        #   @return [Time]
        required :finish_time, Time

        # @!attribute result
        #
        #   @return [Turbopuffer::Models::CopyFromNamespaceOperationResult::Success, Turbopuffer::Models::CopyFromNamespaceOperationResult::Error]
        required :result, union: -> { Turbopuffer::CopyFromNamespaceOperationResult }

        # @!attribute start_time
        #   The time at which the operation started.
        #
        #   @return [Time]
        required :start_time, Time

        # @!attribute status
        #
        #   @return [Symbol, :finished]
        required :status, const: :finished

        # @!method initialize(finish_time:, result:, start_time:, status: :finished)
        #   @param finish_time [Time] The time at which the operation finished.
        #
        #   @param result [Turbopuffer::Models::CopyFromNamespaceOperationResult::Success, Turbopuffer::Models::CopyFromNamespaceOperationResult::Error]
        #
        #   @param start_time [Time] The time at which the operation started.
        #
        #   @param status [Symbol, :finished]
      end

      # @!method self.variants
      #   @return [Array(Turbopuffer::Models::CopyFromNamespaceOperation::Running, Turbopuffer::Models::CopyFromNamespaceOperation::Finished)]
    end
  end
end
