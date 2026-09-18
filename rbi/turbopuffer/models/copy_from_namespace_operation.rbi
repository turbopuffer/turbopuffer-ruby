# typed: strong

module Turbopuffer
  module Models
    # The current status of a copy operation.
    module CopyFromNamespaceOperation
      extend Turbopuffer::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Turbopuffer::CopyFromNamespaceOperation::Running,
            Turbopuffer::CopyFromNamespaceOperation::Finished
          )
        end

      class Running < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::CopyFromNamespaceOperation::Running,
              Turbopuffer::Internal::AnyHash
            )
          end

        # The time at which the operation started.
        sig { returns(Time) }
        attr_accessor :start_time

        sig { returns(Symbol) }
        attr_accessor :status

        # A freeform description of the operation's progress. May be absent, and its
        # format may change.
        sig { returns(T.nilable(String)) }
        attr_reader :progress

        sig { params(progress: String).void }
        attr_writer :progress

        sig do
          params(start_time: Time, progress: String, status: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # The time at which the operation started.
          start_time:,
          # A freeform description of the operation's progress. May be absent, and its
          # format may change.
          progress: nil,
          status: :running
        )
        end

        sig do
          override.returns(
            { start_time: Time, status: Symbol, progress: String }
          )
        end
        def to_hash
        end
      end

      class Finished < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::CopyFromNamespaceOperation::Finished,
              Turbopuffer::Internal::AnyHash
            )
          end

        # The time at which the operation finished.
        sig { returns(Time) }
        attr_accessor :finish_time

        sig { returns(Turbopuffer::CopyFromNamespaceOperationResult::Variants) }
        attr_accessor :result

        # The time at which the operation started.
        sig { returns(Time) }
        attr_accessor :start_time

        sig { returns(Symbol) }
        attr_accessor :status

        sig do
          params(
            finish_time: Time,
            result:
              T.any(
                Turbopuffer::CopyFromNamespaceOperationResult::Success::OrHash,
                Turbopuffer::CopyFromNamespaceOperationResult::Error::OrHash
              ),
            start_time: Time,
            status: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The time at which the operation finished.
          finish_time:,
          result:,
          # The time at which the operation started.
          start_time:,
          status: :finished
        )
        end

        sig do
          override.returns(
            {
              finish_time: Time,
              result: Turbopuffer::CopyFromNamespaceOperationResult::Variants,
              start_time: Time,
              status: Symbol
            }
          )
        end
        def to_hash
        end
      end

      sig do
        override.returns(
          T::Array[Turbopuffer::CopyFromNamespaceOperation::Variants]
        )
      end
      def self.variants
      end
    end
  end
end
