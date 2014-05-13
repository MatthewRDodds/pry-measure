# encoding: UTF-8

require 'pry'

module PryMeasure
  Commands = Pry::CommandSet.new
end

require "pry-measure/measure_command"
require "pry-measure/realtime_command"

Pry.commands.import PryMeasure::Commands
