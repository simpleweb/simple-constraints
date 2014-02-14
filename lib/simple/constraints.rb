require 'simple/constraints/version'
require 'simple/constraints/subdomain'
require 'simple/constraints/ip_address'

module Simple
  module Constraints
    def subdomain(*args, &block)
      constraints Subdomain.new(*args), &block
    end

    def ip_address(*args, &block)
      constraints IPAddress.new(*args), &block
    end
  end
end

require 'simple/constraints/railtie' if defined?(Rails)
