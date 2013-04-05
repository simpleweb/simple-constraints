$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple/constraints/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple-constraints"
  s.version     = Simpleweb::VERSION
  s.authors     = ["Chris Mytton", "Paul Springett"]
  s.email       = ["paul@simpleweb.co.uk"]
  s.homepage    = "https://github.com/simpleweb/simple-constraints"
  s.summary     = "Rails routing constraints utilities"
  s.description = "Adds routing constraints to the host application"

  s.files = Dir["lib/**/*"] + ["Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
end
