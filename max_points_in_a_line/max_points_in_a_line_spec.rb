require 'rspec'
require_relative "max_points_in_a_line.rb"

describe "#max_points" do
  subject { MaxPointsInALine }

  it "returns the right number of maximum points in a line" do
    set_1 = convert_to_points([[1,1],[2,2],[3,3]])
    expect(subject.new.max_points(set_1)).to eq(3)

    set_2 = convert_to_points([[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]])
    expect(subject.new.max_points(set_2)).to eq(4)
  end

  it "handles edgecases gracefully" do
    set = []
    expect(subject.new.max_points(set)).to eq(0)

    point = Point.new(0, 0)
    set = [point]
    expect(subject.new.max_points(set)).to eq(1)

    point = Point.new(1, 1)
    set = [point, point, point]
    expect(subject.new.max_points(set)).to eq(3)

    point_0 = Point.new(0, 0)
    point_1 = Point.new(1, 1)
    set = [point_0, point_1, point_0]
    expect(subject.new.max_points(set)).to eq(3)
  end

  it "handles moar edges" do
    point_0 = Point.new(0, 0)
    point_1 = Point.new(1, 0)
    set = [point_0, point_1]
    expect(subject.new.max_points(set)).to eq(2)
  end

  it "handles some moar edges" do
    point_0 = Point.new(0, 0)
    point_1 = Point.new(1, 1)
    point_2 = Point.new(1, -1)
    set = [point_0, point_1, point_2]
    expect(subject.new.max_points(set)).to eq(2)
  end

  it "handles even moar edges" do
    point_0 = Point.new(1, 1)
    point_1 = Point.new(1, 1)
    point_2 = Point.new(2, 2)
    point_3 = Point.new(2, 2)
    set = [point_0, point_1, point_2, point_3]
    expect(subject.new.max_points(set)).to eq(4)
  end

  it "1" do
    set = []
    [[0,0],[94911151,94911150],[94911152,94911151]].each do |p|
      set << Point.new(p[0], p[1])
    end
    expect(subject.new.max_points(set)).to eq(2)
  end
end

def convert_to_points(points)
  arr = []
  points.each do |point|
    x, y = point
    arr << Point.new(x, y)
  end
  arr
end
