require "bundler"
Bundler.setup

require "rspec"
require "benchmark"
require "pry-measure"

# Borrowed from PryRails project
# Source: https://github.com/rweng/pry-rails/blob/master/spec/spec_helper.rb

def redirect_pry_io(new_in, new_out = StringIO.new)
  old_in  = Pry.input
  old_out = Pry.output

  Pry.input  = new_in
  Pry.output = new_out

  begin
    yield
  ensure
    Pry.input  = old_in
    Pry.output = old_out
  end
end

def mock_pry(*args)
  binding = args.first.is_a?(Binding) ? args.shift : binding()
  input   = StringIO.new(args.join("\n"))
  output  = StringIO.new

  redirect_pry_io(input, output) do
    Pry.start(binding, :hooks => Pry::Hooks.new)
  end

  output.string
end