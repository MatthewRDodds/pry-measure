require 'spec_helper'

describe "pry-measure" do
  it "prints results when given correct format" do
    output = mock_pry('pry-measure -t 10 #{1*2}', 'exit-all')
    expect(output).to match('PryMeasure::Results')
  end

  it "raises correct error when time is passed incorrectly" do
    output = mock_pry('pry-measure -t a #{1*2}', 'exit-all')
    expect(output).to match('Error: -t should be an integer')
  end

  it "succeeds with default if time argument is not passed" do
    output = mock_pry('pry-measure #{1*2}', 'exit-all')
    expect(output).not_to match('Error: -t should be an integer')
  end
end