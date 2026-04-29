# frozen_string_literal: true

module Turbopuffer
  module Models
    class AttributeSchemaConfig < Turbopuffer::Internal::Type::BaseModel
      # @!attribute type
      #   The data type of the attribute. Valid values: string, int, uint, float, uuid,
      #   datetime, bool, []string, []int, []uint, []float, []uuid, []datetime, []bool,
      #   [DIMS]f16, [DIMS]f32, {}f16.
      #
      #   @return [String]
      required :type, String

      # @!attribute ann
      #   Whether to create an approximate nearest neighbor index for the attribute. Can
      #   be a boolean or a detailed configuration object.
      #
      #   @return [Boolean, Turbopuffer::Models::AttributeSchemaConfig::Ann::AnnConfig, nil]
      optional :ann, union: -> { Turbopuffer::AttributeSchemaConfig::Ann }

      # @!attribute filterable
      #   Whether or not the attributes can be used in filters.
      #
      #   @return [Boolean, nil]
      optional :filterable, Turbopuffer::Internal::Type::Boolean

      # @!attribute full_text_search
      #   Whether this attribute can be used as part of a BM25 full-text search. Requires
      #   the `string` or `[]string` type, and by default, BM25-enabled attributes are not
      #   filterable. You can override this by setting `filterable: true`.
      #
      #   @return [Boolean, Turbopuffer::Models::FullTextSearchConfig, nil]
      optional :full_text_search, union: -> { Turbopuffer::FullTextSearch }

      # @!attribute fuzzy
      #   Whether to enable Fuzzy filters on this attribute.
      #
      #   @return [Boolean, nil]
      optional :fuzzy, Turbopuffer::Internal::Type::Boolean

      # @!attribute glob
      #   Whether to enable Glob filters on this attribute.
      #
      #   @return [Boolean, nil]
      optional :glob, Turbopuffer::Internal::Type::Boolean

      # @!attribute regex
      #   Whether to enable Regex filters on this attribute.
      #
      #   @return [Boolean, nil]
      optional :regex, Turbopuffer::Internal::Type::Boolean

      # @!attribute sparse_knn
      #   Whether to create a sparse kNN index for the attribute. Requires the `{}f16`
      #   type.
      #
      #   @return [Turbopuffer::Models::AttributeSchemaConfig::SparseKnn, nil]
      optional :sparse_knn, -> { Turbopuffer::AttributeSchemaConfig::SparseKnn }

      # @!method initialize(type:, ann: nil, filterable: nil, full_text_search: nil, fuzzy: nil, glob: nil, regex: nil, sparse_knn: nil)
      #   Some parameter documentations has been truncated, see
      #   {Turbopuffer::Models::AttributeSchemaConfig} for more details.
      #
      #   Detailed configuration for an attribute attached to a document.
      #
      #   @param type [String] The data type of the attribute. Valid values: string, int, uint, float, uuid, da
      #
      #   @param ann [Boolean, Turbopuffer::Models::AttributeSchemaConfig::Ann::AnnConfig] Whether to create an approximate nearest neighbor index for the attribute. Can b
      #
      #   @param filterable [Boolean] Whether or not the attributes can be used in filters.
      #
      #   @param full_text_search [Boolean, Turbopuffer::Models::FullTextSearchConfig] Whether this attribute can be used as part of a BM25 full-text search. Requires
      #
      #   @param fuzzy [Boolean] Whether to enable Fuzzy filters on this attribute.
      #
      #   @param glob [Boolean] Whether to enable Glob filters on this attribute.
      #
      #   @param regex [Boolean] Whether to enable Regex filters on this attribute.
      #
      #   @param sparse_knn [Turbopuffer::Models::AttributeSchemaConfig::SparseKnn] Whether to create a sparse kNN index for the attribute. Requires the `{}f16` typ

      # Whether to create an approximate nearest neighbor index for the attribute. Can
      # be a boolean or a detailed configuration object.
      #
      # @see Turbopuffer::Models::AttributeSchemaConfig#ann
      module Ann
        extend Turbopuffer::Internal::Type::Union

        variant Turbopuffer::Internal::Type::Boolean

        # Configuration options for ANN (Approximate Nearest Neighbor) indexing.
        variant -> { Turbopuffer::AttributeSchemaConfig::Ann::AnnConfig }

        class AnnConfig < Turbopuffer::Internal::Type::BaseModel
          # @!attribute distance_metric
          #   A function used to calculate vector similarity.
          #
          #   @return [Symbol, Turbopuffer::Models::DistanceMetric, nil]
          optional :distance_metric, enum: -> { Turbopuffer::DistanceMetric }

          # @!method initialize(distance_metric: nil)
          #   Configuration options for ANN (Approximate Nearest Neighbor) indexing.
          #
          #   @param distance_metric [Symbol, Turbopuffer::Models::DistanceMetric] A function used to calculate vector similarity.
        end

        # @!method self.variants
        #   @return [Array(Boolean, Turbopuffer::Models::AttributeSchemaConfig::Ann::AnnConfig)]
      end

      # @see Turbopuffer::Models::AttributeSchemaConfig#sparse_knn
      class SparseKnn < Turbopuffer::Internal::Type::BaseModel
        # @!attribute distance_metric
        #   A function used to calculate sparse vector similarity.
        #
        #   @return [Symbol, :dot_product]
        required :distance_metric, const: :dot_product

        # @!method initialize(distance_metric: :dot_product)
        #   Whether to create a sparse kNN index for the attribute. Requires the `{}f16`
        #   type.
        #
        #   @param distance_metric [Symbol, :dot_product] A function used to calculate sparse vector similarity.
      end
    end
  end
end
