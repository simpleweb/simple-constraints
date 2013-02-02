module Simpleweb
  module Constraints

    def subdomain(*args, &block)
      constraints Subdomain.new(*args), &block
    end

    class Subdomain
      attr_reader :tld_length
      attr_reader :except
      attr_reader :only

      # Create a new Subdomain constraint.
      #
      # @param [Integer] tld_length The number of sections after the subdomain.
      # @param [Array] reserved_subdomains Reserved Subdomains
      def initialize(options = {})
        @tld_length = options[:tld_length] || 1
        @except = Array(options[:except])
        @only = Array(options[:only])
      end

      # Does the request match the constraint.
      #
      # @param [ActionDispatch::Request] request The request to test for a match.
      def matches?(request)
        subdomain = request.subdomain(tld_length)
        if subdomain.present?
          if only.present?
            return only.include?(subdomain)
          end

          return !except.include?(subdomain)
        end
        false
      end
    end
  end
end
