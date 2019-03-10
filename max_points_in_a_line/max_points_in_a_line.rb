class MaxPointsInALine
  def max_points(points)
    common_points = gather_common_points(points)
    reduced_points = remove_dupes(points)
    length = reduced_points.length
    return 0 if length == 0
    return common_points[point_key(reduced_points.first)] if length == 1
    i = 0
    max = 1
    while i < length
      j = i+1
      slopes = {}
      while j < length
        point_i = reduced_points[i]
        point_j = reduced_points[j]
        puts "--- Run: #{point_i.inspect} - #{point_j.inspect}"
        slope = calculate_slope(point_i, point_j)
        puts "slope: #{slope}"
        slope_key = slope.to_s
        slopes[slope_key] ||= common_points[point_key(point_i)]
        slopes[slope_key] += common_points[point_key(point_j)]
        puts "-"*20
        puts slopes.inspect
        puts "-"*20
        if slopes[slope_key] > max
          max = slopes[slope_key]
          puts "max changed to: #{max}"
        end
        j += 1
      end
      i += 1
    end
    max
  end

  def calculate_slope(point_1, point_2)
    x1 = point_1.x
    x2 = point_2.x
    y1 = point_1.y
    y2 = point_2.y

    if x1 == x2
      return "na"
    end

    if y1 == y2
      return 0
    end

    slope = (y2 - y1).to_f / (x2 - x1)
    slope
  end

  def gather_common_points(points)
    res = {}
    points.each do |point|
      key = "#{point.x},#{point.y}"
      res[key] ||= 0
      res[key] += 1
    end
    res
  end

  def remove_dupes(points)
    res = []
    hash = {}
    points.each do |point|
      key = "#{point.x},#{point.y}"
      if hash[key]
        next
      else
        hash[key] = true
        res << point
      end
    end
    res
  end

  def point_key(point)
    "#{point.x},#{point.y}"
  end
end

class Point
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
end
