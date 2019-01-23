require 'benchmark'

class Triplet
  def initialize(*array)
    @triplet = array
  end

  def self.where(max_factor: 100, min_factor: 1, sum: nil)
    combinations = [*min_factor..max_factor].combination(3).to_a

    combinations.each_with_object([]) do |combination, triplets|
      triplet = Triplet.new(*combination)
      next if sum && !(triplet.sum == sum)
      triplets << triplet if triplet.pythagorean?
    end
  end

  def sum
    @triplet.sum
  end

  def product
    @triplet.reduce(:*)
  end

  def pythagorean?
    @triplet[0] ** 2 + @triplet[1] ** 2 == @triplet[2] ** 2
  end
end

puts Benchmark.measure { Triplet.where(max_factor: 100) }
