module PryMeasure
  class Marker
    def self.measure(execution_times, arg_string, command, realtime=false, show_output=false, results=[])
      execution_times.times do
        results << Benchmark.measure do
          begin
            command.interpolate_string arg_string
          rescue Pry::RescuableException => ex
            raise Pry::CommandError, ex
          end
        end
      end

      if show_output == true
        unless realtime
          puts "    user     system      total        real"
        end
        puts results
      end

      average = average_results(results, execution_times)
      realtime ? average[:real] : average
    end

    def self.average_results(results, execution_times, response={})
      [:real, :utime, :stime, :total].each do |key|
        response.merge!(key =>(results.map(&key).inject(&:+) / execution_times.to_i).round(4)) rescue binding.pry
      end
      response
    end
  end
end