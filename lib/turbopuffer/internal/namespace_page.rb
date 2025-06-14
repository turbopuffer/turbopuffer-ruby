# frozen_string_literal: true

module Turbopuffer
  module Internal
    # @generic Elem
    #
    # @example
    #   if namespace_page.has_next?
    #     namespace_page = namespace_page.next_page
    #   end
    #
    # @example
    #   namespace_page.auto_paging_each do |client|
    #     puts(client)
    #   end
    class NamespacePage
      include Turbopuffer::Internal::Type::BasePage

      # @return [Array<generic<Elem>>, nil]
      attr_accessor :namespaces

      # @return [String]
      attr_accessor :next_cursor

      # @return [Boolean]
      def next_page?
        !namespaces.to_a.empty? && !next_cursor.to_s.empty?
      end

      # @raise [Turbopuffer::HTTP::Error]
      # @return [self]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = Turbopuffer::Internal::Util.deep_merge(@req, {query: {cursor: next_cursor}})
        @client.request(req)
      end

      # @param blk [Proc]
      #
      # @yieldparam [generic<Elem>]
      def auto_paging_each(&blk)
        unless block_given?
          raise ArgumentError.new("A block must be given to ##{__method__}")
        end

        page = self
        loop do
          page.namespaces&.each(&blk)

          break unless page.next_page?
          page = page.next_page
        end
      end

      # @api private
      #
      # @param client [Turbopuffer::Internal::Transport::BaseClient]
      # @param req [Hash{Symbol=>Object}]
      # @param headers [Hash{String=>String}, Net::HTTPHeader]
      # @param page_data [Hash{Symbol=>Object}]
      def initialize(client:, req:, headers:, page_data:)
        super

        case page_data
        in {namespaces: Array => namespaces}
          @namespaces = namespaces.map { Turbopuffer::Internal::Type::Converter.coerce(@model, _1) }
        else
        end
        @next_cursor = page_data[:next_cursor]
      end

      # @api private
      #
      # @return [String]
      def inspect
        model = Turbopuffer::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)} next_cursor=#{next_cursor.inspect}>"
      end
    end
  end
end
