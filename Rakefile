#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'bundler/gem_tasks'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

task :default => :spec

require 'yard'

YARD::Rake::YardocTask.new
