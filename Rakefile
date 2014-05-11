require "rubygems"
require "bundler"
Bundler.setup

RSpec::Core::RakeTask.new(:spec)

gemspec = eval(File.read("pry-measure.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["pry-measure.gemspec"] do
  system "gem build pry-measure.gemspec"
  system "gem install pry-measure-#{PryMeasure::VERSION}.gem"
end