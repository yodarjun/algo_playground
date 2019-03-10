require 'rspec'
require_relative 'boggle.rb'

describe "Boggle#find_all_words" do
  let(:board) do
    [
      ['G','I','Z'],
      ['U','E','K'],
      ['Q','S','E']
    ]
  end

  let(:dictionary) do
    ["GEEKS", "FOR", "QUIZ", "GO"]
  end

  subject { Boggle.new(board, dictionary) }

  it "returns valid words in the dictionary" do
    expect(subject.find_words).to eq(["GEEKS", "QUIZ"])
  end
end
