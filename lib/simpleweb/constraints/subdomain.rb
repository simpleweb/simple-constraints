module Simpleweb
  module Constraints
    class Subdomain
      attr_reader :tld_size
      attr_reader :reserved_subdomains

      # Create a new Subdomain constraint.
      #
      # @param [Integer] tld_size The number of sections after the subdomain.
      # @param [Array] reserved_subdomains Reserved Subdomains
      def initialize(tld_size, reserved_subdomains = [])
        @tld_size = tld_size
        @reserved_subdomains = reserved_subdomains
      end

      # Does the request match the constraint.
      #
      # @param [Rack::Request] request The request to test for a match.
      def matches?(request)
        request.subdomain(tld_size).present? && !reserved_subdomains.include?(request.subdomains.first)
      end
    end
  end
end
