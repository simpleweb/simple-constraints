require 'simpleweb/constraints/subdomain'

module Simpleweb
  module Constraints
    def subdomain(*args, &block)
      constraints Simpleweb::Constraints::Subdomain.new(*args), &block
    end
  end
end
