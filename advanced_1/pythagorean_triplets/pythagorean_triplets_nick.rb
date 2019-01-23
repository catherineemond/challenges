require 'benchmark'
require 'set'

class Triplet
  def self.where(max_factor:, min_factor: 1, sum: nil)
    triplets(max_factor, min_factor).reject { |triplet| sum&.!= triplet.sum }
  end

  def self.triplets(max, min)
    min.upto(max - 2).with_object(Set.new) do |a, triplets|
      (a + 1).upto(max - 1) do |b|
        (b + 1).upto(max) do |c|
          break unless a + b > c
          triplet = new(a, b, c)
          triplets << triplet if triplet.pythagorean?
        end
      end
    end
  end

  def initialize(*nums)
    @nums = nums
  end

  def sum
    @nums.sum
  end

  def product
    @nums.reduce(:*)
  end

  def pythagorean?
    @nums.map(&:abs2).tap { |a, b, c| return a + b == c }
  end
end

puts Benchmark.measure { Triplet.where(max_factor: 100) }
