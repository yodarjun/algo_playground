class Subsets
  attr_accessor :array
  def initialize(array)
    @array = array
  end

  def fetch_subsets
    results = [[]]
    array.each do |num|
      results = retain_and_add(results, num)
    end

    results
  end

  def retain_and_add(results, num)
    new_results = []
    results.each do |sub_set|
      new_results << sub_set
      new_results << sub_set + [num]
    end
    new_results
  end
end
