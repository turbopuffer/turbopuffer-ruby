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

      # The data type of the attribute. Valid values: string, int, uint, float, uuid,
      # datetime, bool, []string, []int, []uint, []float, []uuid, []datetime, []bool,
      # [DIMS]f16, [DIMS]f32, {}f16.
      sig { returns(String) }
      attr_accessor :type

      # Whether to create an approximate nearest neighbor index for the attribute. Can
      # be a boolean or a detailed configuration object.
      sig do
        returns(
          T.nilable(
            T.any(
              T::Boolean,
              Turbopuffer::AttributeSchemaConfig::Ann::AnnConfig
            )
          )
        )
      end
      attr_reader :ann

      sig do
        params(
          ann:
            T.any(
              T::Boolean,
              Turbopuffer::AttributeSchemaConfig::Ann::AnnConfig::OrHash
            )
        ).void
      end
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

      # Whether to enable Fuzzy filters on this attribute.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :fuzzy

      sig { params(fuzzy: T::Boolean).void }
      attr_writer :fuzzy

      # Whether to enable Glob filters on this attribute.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :glob

      sig { params(glob: T::Boolean).void }
      attr_writer :glob

      # Whether to enable Regex filters on this attribute.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :regex

      sig { params(regex: T::Boolean).void }
      attr_writer :regex

      # Whether to create a sparse kNN index for the attribute. Requires the `{}f16`
      # type.
      sig { returns(T.nilable(Turbopuffer::AttributeSchemaConfig::SparseKnn)) }
      attr_reader :sparse_knn

      sig do
        params(
          sparse_knn: Turbopuffer::AttributeSchemaConfig::SparseKnn::OrHash
        ).void
      end
      attr_writer :sparse_knn

      # Detailed configuration for an attribute attached to a document.
      sig do
        params(
          type: String,
          ann:
            T.any(
              T::Boolean,
              Turbopuffer::AttributeSchemaConfig::Ann::AnnConfig::OrHash
            ),
          filterable: T::Boolean,
          full_text_search:
            T.any(T::Boolean, Turbopuffer::FullTextSearchConfig::OrHash),
          fuzzy: T::Boolean,
          glob: T::Boolean,
          regex: T::Boolean,
          sparse_knn: Turbopuffer::AttributeSchemaConfig::SparseKnn::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The data type of the attribute. Valid values: string, int, uint, float, uuid,
        # datetime, bool, []string, []int, []uint, []float, []uuid, []datetime, []bool,
        # [DIMS]f16, [DIMS]f32, {}f16.
        type:,
        # Whether to create an approximate nearest neighbor index for the attribute. Can
        # be a boolean or a detailed configuration object.
        ann: nil,
        # Whether or not the attributes can be used in filters.
        filterable: nil,
        # Whether this attribute can be used as part of a BM25 full-text search. Requires
        # the `string` or `[]string` type, and by default, BM25-enabled attributes are not
        # filterable. You can override this by setting `filterable: true`.
        full_text_search: nil,
        # Whether to enable Fuzzy filters on this attribute.
        fuzzy: nil,
        # Whether to enable Glob filters on this attribute.
        glob: nil,
        # Whether to enable Regex filters on this attribute.
        regex: nil,
        # Whether to create a sparse kNN index for the attribute. Requires the `{}f16`
        # type.
        sparse_knn: nil
      )
      end

      sig do
        override.returns(
          {
            type: String,
            ann:
              T.any(
                T::Boolean,
                Turbopuffer::AttributeSchemaConfig::Ann::AnnConfig
              ),
            filterable: T::Boolean,
            full_text_search:
              T.any(T::Boolean, Turbopuffer::FullTextSearchConfig),
            fuzzy: T::Boolean,
            glob: T::Boolean,
            regex: T::Boolean,
            sparse_knn: Turbopuffer::AttributeSchemaConfig::SparseKnn
          }
        )
      end
      def to_hash
      end

      # Whether to create an approximate nearest neighbor index for the attribute. Can
      # be a boolean or a detailed configuration object.
      module Ann
        extend Turbopuffer::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              T::Boolean,
              Turbopuffer::AttributeSchemaConfig::Ann::AnnConfig
            )
          end

        class AnnConfig < Turbopuffer::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Turbopuffer::AttributeSchemaConfig::Ann::AnnConfig,
                Turbopuffer::Internal::AnyHash
              )
            end

          # A function used to calculate vector similarity.
          sig { returns(T.nilable(Turbopuffer::DistanceMetric::OrSymbol)) }
          attr_reader :distance_metric

          sig do
            params(distance_metric: Turbopuffer::DistanceMetric::OrSymbol).void
          end
          attr_writer :distance_metric

          # Configuration options for ANN (Approximate Nearest Neighbor) indexing.
          sig do
            params(
              distance_metric: Turbopuffer::DistanceMetric::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # A function used to calculate vector similarity.
            distance_metric: nil
          )
          end

          sig do
            override.returns(
              { distance_metric: Turbopuffer::DistanceMetric::OrSymbol }
            )
          end
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Turbopuffer::AttributeSchemaConfig::Ann::Variants]
          )
        end
        def self.variants
        end
      end

      class SparseKnn < Turbopuffer::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Turbopuffer::AttributeSchemaConfig::SparseKnn,
              Turbopuffer::Internal::AnyHash
            )
          end

        # A function used to calculate sparse vector similarity.
        sig { returns(Turbopuffer::SparseDistanceMetric::OrSymbol) }
        attr_accessor :distance_metric

        # Whether to create a sparse kNN index for the attribute. Requires the `{}f16`
        # type.
        sig do
          params(
            distance_metric: Turbopuffer::SparseDistanceMetric::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # A function used to calculate sparse vector similarity.
          distance_metric:
        )
        end

        sig do
          override.returns(
            { distance_metric: Turbopuffer::SparseDistanceMetric::OrSymbol }
          )
        end
        def to_hash
        end
      end
    end
  end
end
