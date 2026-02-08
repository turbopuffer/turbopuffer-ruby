# typed: strong

module Turbopuffer
  module Models
    class Limit < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Turbopuffer::Limit, Turbopuffer::Internal::AnyHash)
        end

      # Limits the total number of documents returned.
      sig { returns(Integer) }
      attr_accessor :total

      # Limits the number of documents with the same value for a set of attributes (the
      # "limit key") that can appear in the results.
      sig { returns(T.nilable(Turbopuffer::Limit::Per)) }
      attr_reader :per

      sig { params(per: Turbopuffer::Limit::Per::OrHash).void }
      attr_writer :per

      # Limits the documents returned by a query.
      sig do
        params(total: Integer, per: Turbopuffer::Limit::Per::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(
        # Limits the total number of documents returned.
        total:,
        # Limits the number of documents with the same value for a set of attributes (the
        # "limit key") that can appear in the results.
        per: nil
      )
      end

      sig { override.returns({ total: Integer, per: Turbopuffer::Limit::Per }) }
      def to_hash
      end

      class Per < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Turbopuffer::Limit::Per, Turbopuffer::Internal::AnyHash)
          end

        # The attributes to include in the limit key.
        sig { returns(T::Array[String]) }
        attr_accessor :attributes

        # The maximum number of documents to return for each value of the limit key.
        sig { returns(Integer) }
        attr_accessor :limit

        # Limits the number of documents with the same value for a set of attributes (the
        # "limit key") that can appear in the results.
        sig do
          params(attributes: T::Array[String], limit: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # The attributes to include in the limit key.
          attributes:,
          # The maximum number of documents to return for each value of the limit key.
          limit:
        )
        end

        sig do
          override.returns({ attributes: T::Array[String], limit: Integer })
        end
        def to_hash
        end
      end
    end
  end
end
