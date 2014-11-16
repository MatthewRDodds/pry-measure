# -*- encoding: utf-8 -*-

require File.expand_path("../lib/pry-measure/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "pry-measure"
  s.version     = PryMeasure::VERSION
  # s.platform    = Gem::Platform::RUBY
  s.authors     = ["Matthew Dodds"]
  s.email       = ["matthewrusselldodds@gmail.com"]
  s.homepage    = "http://github.com/matthewrdodds/pry-measure"
  s.summary     = "Adds simple benchmark tool to pry"
  s.license     = "MIT"

  s.required_rubygems_version = ">= 1.3.6"

  s.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.require_path = 'lib'

  s.add_dependency "pry", ">= 0.9.10"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
end
