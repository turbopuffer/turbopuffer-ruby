# typed: strong

module Turbopuffer
  module Models
    class AttributeSchemaConfig < Turbopuffer::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Turbopuffer::AttributeSchemaConfig,
            Turbopuffer::Internal::AnyHash
          )
        end

      # Whether to create an approximate nearest neighbor index for the attribute.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :ann

      sig { params(ann: T::Boolean).void }
      attr_writer :ann

      # Whether or not the attributes can be used in filters.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :filterable

      sig { params(filterable: T::Boolean).void }
      attr_writer :filterable

      # Whether this attribute can be used as part of a BM25 full-text search. Requires
      # the `string` or `[]string` type, and by default, BM25-enabled attributes are not
      # filterable. You can override this by setting `filterable: true`.
      sig do
        returns(T.nilable(T.any(T::Boolean, Turbopuffer::FullTextSearchConfig)))
      end
      attr_reader :full_text_search

      sig do
        params(
          full_text_search:
            T.any(T::Boolean, Turbopuffer::FullTextSearchConfig::OrHash)
        ).void
      end
      attr_writer :full_text_search

      # The data type of the attribute. Valid values: string, int, uint, uuid, datetime,
      # bool, []string, []int, []uint, []uuid, []datetime, [DIMS]f16, [DIMS]f32.
      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      # Detailed configuration for an attribute attached to a document.
      sig do
        params(
          ann: T::Boolean,
          filterable: T::Boolean,
          full_text_search:
            T.any(T::Boolean, Turbopuffer::FullTextSearchConfig::OrHash),
          type: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether to create an approximate nearest neighbor index for the attribute.
        ann: nil,
        # Whether or not the attributes can be used in filters.
        filterable: nil,
        # Whether this attribute can be used as part of a BM25 full-text search. Requires
        # the `string` or `[]string` type, and by default, BM25-enabled attributes are not
        # filterable. You can override this by setting `filterable: true`.
        full_text_search: nil,
        # The data type of the attribute. Valid values: string, int, uint, uuid, datetime,
        # bool, []string, []int, []uint, []uuid, []datetime, [DIMS]f16, [DIMS]f32.
        type: nil
      )
      end

      sig do
        override.returns(
          {
            ann: T::Boolean,
            filterable: T::Boolean,
            full_text_search:
              T.any(T::Boolean, Turbopuffer::FullTextSearchConfig),
            type: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
