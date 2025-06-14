# frozen_string_literal: true

module Turbopuffer
  class Namespace < Turbopuffer::Resources::Namespaces
    # Returns the namespace ID.
    #
    # @return [String]
    def id
      @client.default_namespace
    end

    # @api private
    #
    # @param client [Turbopuffer::Client]
    # @param namespace [String]
    def initialize(client, namespace)
      client = client.dup
      client.instance_variable_set(:@default_namespace, namespace)
      super(client: client)
    end
  end
end
