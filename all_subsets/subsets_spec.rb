require 'rspec'
require_relative 'subsets.rb'

describe "Subsets#fetch_subsets" do
  subject { Subsets.new([1, 2, 3]) }

  it "returns all the subsets of the given array" do
    expected = [
      [],
      [1],
      [2],
      [3],
      [1,2],
      [1,3],
      [2,3],
      [1,2,3]
    ]
    actual = subject.fetch_subsets
    expect(expected - actual).to eq([])
    expect(actual - expected).to eq([])
  end
end
