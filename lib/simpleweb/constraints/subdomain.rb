module Simpleweb
  module Constraints
    class Subdomain
      attr_reader :tld_length
      attr_reader :reserved_subdomains

      # Create a new Subdomain constraint.
      #
      # @param [Integer] tld_length The number of sections after the subdomain.
      # @param [Array] reserved_subdomains Reserved Subdomains
      def initialize(tld_length, reserved_subdomains = [])
        @tld_length = tld_length
        @reserved_subdomains = reserved_subdomains
      end

      # Does the request match the constraint.
      #
      # @param [Rack::Request] request The request to test for a match.
      def matches?(request)
        request.subdomain(tld_length).present? && !reserved_subdomains.include?(request.subdomains.first)
      end
    end
  end
end
