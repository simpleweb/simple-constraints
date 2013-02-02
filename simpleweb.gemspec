$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simpleweb/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simpleweb"
  s.version     = Simpleweb::VERSION
  s.authors     = ["Chris Mytton"]
  s.email       = ["chrism@simpleweb.co.uk"]
  s.homepage    = "https://github.com/simpleweb/simpleweb-toolkit"
  s.summary     = "Simpleweb Rails utilities"
  s.description = "Adds routing constraints and model validations to the host application"

  s.files = Dir["lib/**/*"] + ["Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
end
