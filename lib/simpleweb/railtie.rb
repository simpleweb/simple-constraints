require 'rails/railtie'

module Simpleweb
  class Railtie < Rails::Railtie
    initializer "simpleweb.setup_router" do
      ActionDispatch::Routing::Mapper.send(:include, Simpleweb::Constraints)
    end
  end
end
