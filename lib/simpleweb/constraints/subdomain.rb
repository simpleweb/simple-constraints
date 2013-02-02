module Simpleweb
  module Constraints
    class Subdomain
      attr_reader :tld_length
      attr_reader :exclude

      # Create a new Subdomain constraint.
      #
      # @param [Integer] tld_length The number of sections after the subdomain.
      # @param [Array] reserved_subdomains Reserved Subdomains
      def initialize(options = {})
        @tld_length = options[:tld_length] || 1
        @exclude = options[:exclude] || []
      end

      # Does the request match the constraint.
      #
      # @param [Rack::Request] request The request to test for a match.
      def matches?(request)
        request.subdomain(tld_length).present? && !exclude.include?(request.subdomains.first)
      end
    end
  end
end
