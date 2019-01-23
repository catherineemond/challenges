require 'minitest/autorun'
require 'minitest/benchmark'
require_relative 'pythagorean_triplets_nick'

class BenchTriplets < MiniTest::Benchmark
  def self.bench_range
      [1,10,100, 1000, 10000, 100000]
  end

  def bench_triplets
    assert_performance 0.9 do |n|
      triplets = Triplet.where(max_factor: n)
      products = triplets.map(&:product).sort
    end
  end
end
