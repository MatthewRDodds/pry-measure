PryMeasure::Commands.create_command "pry-measure" do
  description "Measure a block of code using Ruby's benchmark module"

  TEST_TIMES_DESC = 'Times to execute test code (default: 10)'
  EXEC_TIMES_DESC = 'Times to run benchmark (n times -t)'

  banner <<-BANNER
    Usage: pry-measure [ -t <times> -c <times> ] <test code>

    -t   #{TEST_TIMES_DESC}
    -c   #{EXEC_TIMES_DESC}

    Executes the code for the given amount of -t times (or default 10) 
    and returns benchmark results.
  BANNER

  command_options(
    shellwords: false,
    keep_retval: true,
    interpolate: false
  )

  def setup
    @test_times = 10
    @exec_times = 1
  end

  def options(opt)
    opt.on :c, :count, EXEC_TIMES_DESC, optional: true, argument: true
    opt.on :t, :times, TEST_TIMES_DESC, optional: true, argument: true
  end

  def validate(option)
    unless is_int?(option)
      raise Pry::CommandError, "#{option} isn't an integer"
    end

    option.to_i
  end

  def process
    @test_times = validate(opts[:count]) if opts[:count]
    @exec_times = validate(opts[:times]) if opts[:times]

    code = args.join(' ')

    PryMeasure::Marker.measure @exec_times, @test_times, code
  end

  def is_int?(candidate)
    !!(candidate =~ /^[-+]?[0-9]+$/)
  end
end
