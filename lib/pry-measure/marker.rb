require "pry-measure/results"

module PryMeasure
  class Marker
    def self.measure(execution_times, arg_string, command)
      tms = Benchmark.measure do
        execution_times.times do
          begin
            command.interpolate_string arg_string
          rescue Pry::RescuableException => ex
            raise Pry::CommandError, ex
          end
        end
      end
      Results.new tms
    end
  end
end