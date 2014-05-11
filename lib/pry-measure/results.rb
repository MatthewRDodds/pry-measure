module PryMeasure
  class Results
    attr_accessor :user_cpu_time, :system_cpu_time, :total_time, :real_time

    def initialize(tms)
      @total_time = tms.total
      @user_cpu_time = tms.utime
      @system_cpu_time = tms.stime
      @real_time = tms.real
    end
  end
end