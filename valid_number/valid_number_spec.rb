require 'rspec'
require_relative "valid_number.rb"

describe "#is_number" do
  it "returns false when not a valid number" do
    expect(is_number?("abc")).to eq(false)
    expect(is_number?("1 a")).to eq(false)
    expect(is_number?(" 1e")).to eq(false)
    expect(is_number?("e3")).to eq(false)
    expect(is_number?(" 99e2.5 ")).to eq(false)
    expect(is_number?(" --6 ")).to eq(false)
    expect(is_number?("-+3")).to eq(false)
    expect(is_number?("95a54e53")).to eq(false)
    expect(is_number?(".")).to eq(false)
    expect(is_number?(" ")).to eq(false)
    expect(is_number?("6+1")).to eq(false)
    expect(is_number?("0e")).to eq(false)
    expect(is_number?(".-2")).to eq(false)
  end

  it "returns true when valid number" do
    expect(is_number?("0")).to eq(true)
    expect(is_number?("0.1")).to eq(true)
    expect(is_number?("2e10")).to eq(true)
    expect(is_number?(" -90e3   ")).to eq(true)
    expect(is_number?(" 6e-1")).to eq(true)
    expect(is_number?("53.5e93")).to eq(true)
    expect(is_number?("3.")).to eq(true)
  end
end
