require 'rspec'
require_relative "closest_palindrome.rb"

describe "#closest_palindrome" do
  it "returns the closest palindrome" do
    expect(closest_palindrome("123")).to eq("121")
    expect(closest_palindrome("1000")).to eq("1001")
    expect(closest_palindrome("999")).to eq("999")
    expect(closest_palindrome("1234")).to eq("1221")
  end
end
