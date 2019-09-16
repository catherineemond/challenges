require 'benchmark'
require 'pry'

class Triplet
  def initialize(*array)
    @triplet = array
  end

  def self.where(max_factor: 100, min_factor: 1, sum: nil)
    triplets = []

    min_factor.upto(max_factor - 2).each do |a|
      (a + 1).upto(max_factor - 1).each do |b|
        (b + 1).upto(max_factor).each do |c|
          break unless a + b > c
          triplet = Triplet.new(a, b, c)
          next if sum && !(triplet.sum == sum)
          triplets << triplet if triplet.pythagorean?
        end
      end
    end

    triplets
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
