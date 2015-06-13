module PryMeasure
  class Marker
    def self.measure(execution_times, test_times, code)
      Benchmark.bm do |x|
        test_times.times do
          x.report do
            execution_times.times do
              Kernel.eval code
            end
          end
        end
      end
    end
  end
end
