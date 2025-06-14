# typed: strong

module Turbopuffer
  class Namespace < Turbopuffer::Resources::Namespaces
    sig { returns(String) }
    attr_reader :id
  end
end
