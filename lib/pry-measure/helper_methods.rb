# Helper methods

# Credit for `time_method`: http://www.skorks.com/2010/03/timing-ruby-code-it-is-easy-with-benchmark/

def time_method(object, method, *args)
  beginning_time = Time.now
  object.send(method, *args)
  end_time = Time.now
  puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"
end

def pry_measure(test_times = 10, exec_times = 1, &b)
  Benchmark.bm do |x|
    test_times.times do
      x.report do
        exec_times.times do
          yield
        end
      end
    end
  end
end
