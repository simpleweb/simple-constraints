require 'simple/constraints/subdomain'

module Simple
  module Constraints
    def subdomain(*args, &block)
      constraints Subdomain.new(*args), &block
    end
  end
end
