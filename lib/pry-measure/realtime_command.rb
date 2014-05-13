require "pry-measure/marker"

PryMeasure::Commands.create_command "pry-realtime" do
  description "Measure the execution time of code using Ruby's Benchmark.realtime"

  banner <<-BANNER
    Usage: pry-realtime <code>

    Evaluates code using Benchmark.realtime
  BANNER

  command_options(
    shellwords: false,
    keep_retval: true,
    interpolate: false
  )

  def process
    PryMeasure::Marker.measure 1, arg_string, self, true
  end
end