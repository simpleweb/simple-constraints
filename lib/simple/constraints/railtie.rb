require 'rails/railtie'

module Simple::Constraints
  class Railtie < Rails::Railtie
    initializer "simple.constraints.setup_router" do
      ActionDispatch::Routing::Mapper.send(:include, Simple::Constraints)
    end
  end
end
