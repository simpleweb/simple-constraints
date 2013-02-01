module Simpleweb
  module Constraints
    class SubDomain
      attr_reader :tld_size
      attr_reader :reserved_subdomains

      def initialize(tld_size, reserved_subdomains = [])
        @tld_size = tld_size
        @reserved_subdomains = reserved_subdomains
      end

      def matches?(request)
        request.subdomain(tld_size).present? && !reserved_subdomains.include?(request.subdomains.first)
      end
    end
  end
end
