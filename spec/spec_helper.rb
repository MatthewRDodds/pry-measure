require "bundler"
Bundler.setup

require "rspec"
require "benchmark"
require "pry-measure"

# Borrowed from PryRails project
# Source: https://github.com/rweng/pry-rails/blob/master/spec/spec_helper.rb

def redirect_pry_io(new_in, new_out = StringIO.new)
  old_in, old_out  = Pry.input, Pry.output
  Pry.input, Pry.output = new_in, new_out

  begin
    yield
  ensure
    Pry.input, Pry.output = old_in, old_out
  end
end

def mock_pry(*args)
  binding2 = args.first.is_a?(Binding) ? args.shift : binding()
  input   = StringIO.new(args.join("\n"))
  output  = StringIO.new

  redirect_pry_io(input, output) do
    Pry.start(binding2, :hooks => Pry::Hooks.new);nil
  end;nil

  output.string
end