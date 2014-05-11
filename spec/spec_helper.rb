require "bundler"
Bundler.setup

require "rspec"
require "benchmark"
require "pry-measure"

# Borrowed from Pry project
# Source: https://github.com/pry/pry/blob/master/spec/spec_helpers/mock_pry.rb

class InputTester
  def initialize(*actions)
    @orig_actions = actions.dup
    @actions = actions
  end

  def readline(*)
    @actions.shift
  end

  def rewind
    @actions = @orig_actions.dup
  end
end

def redirect_pry_io(new_in, new_out = StringIO.new)
  old_in = Pry.config.input
  old_out = Pry.config.output

  Pry.config.input = new_in
  Pry.config.output = new_out
  begin
    yield
  ensure
    Pry.config.input = old_in
    Pry.config.output = old_out
  end
end

def mock_pry(*args)
  args.flatten!
  binding = args.first.is_a?(Binding) ? args.shift : binding()
  options = args.last.is_a?(Hash) ? args.pop : {}

  input = InputTester.new(*args)
  output = StringIO.new

  redirect_pry_io(input, output) do
    binding.pry(options)
  end

  output.string
end