require "pry-measure/marker"

PryMeasure::Commands.create_command "pry-measure" do
  description "Measure a block of code using Ruby's benchmark module"

  banner <<-BANNER
    Usage: measure [ -t <times> -s ] <block>

    Calls the block for the given amount of times (default 500) and returns benchmark results.
  BANNER

  command_options(
    shellwords: false,
    keep_retval: true,
    interpolate: false
  )

  def setup
    @times = 500
  end

  def options(opt)
    opt.on :s, :show, "Shows default benchmark output"
    opt.on :t, :times, "Times to call block (default: 500)", optional: true, argument: true
  end

  def process
    if opts[:times]
      @times = opts[:times]
      raise Pry::CommandError, "-t should be an integer" unless times_is_int?
    end

    output = !opts[:show].nil?

    PryMeasure::Marker.measure @times.to_i, arg_string, self, false, output
  end

  def times_is_int?
    !!(@times =~ /^[-+]?[0-9]+$/)
  end
end