require 'spec_helper'

describe "pry-realtime" do
  it "prints results when given correct format" do
    output = mock_pry('pry-realtime #{1*2}', 'exit-all')
    expect(output).to match('0.0')
  end
end