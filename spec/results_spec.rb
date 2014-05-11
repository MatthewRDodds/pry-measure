# encoding: UTF-8
require 'spec_helper'

describe PryMeasure::Results do
  before do
    @tms = Benchmark.measure { 'a' * 100 }
  end

  it "instantiates with correct instance attributes" do
    results = PryMeasure::Results.new @tms
    expect(results).to respond_to(:total_time)
    expect(results).to respond_to(:user_cpu_time)
    expect(results).to respond_to(:system_cpu_time)
    expect(results).to respond_to(:real_time)
    @tms
  end
end