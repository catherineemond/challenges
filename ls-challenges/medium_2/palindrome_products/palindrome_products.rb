# works, but slow => maybe try with a hash to avoid recalculating

class Palindromes #:nodoc:
  def initialize(max_factor: 1, min_factor: 1)
    @range = (min_factor..max_factor).to_a
    @factors = @range.product(@range).map(&:sort).uniq
  end

  def generate
    @palindromes = @factors.select { |pair| palindrome?(pair.inject(&:*)) }
    @palindromic_products = @palindromes.map { |pair| pair.inject(&:*) }
  end

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end

  def largest
    max = @palindromic_products.max
    max_factors = @palindromes.select { |pair| pair.inject(&:*) == max }
    PalindromicNumber.new(max, max_factors)
  end

  def smallest
    min = @palindromic_products.min
    min_factors = @palindromes.select { |pair| pair.inject(&:*) == min }
    PalindromicNumber.new(min, min_factors)
  end
end

class PalindromicNumber #:nodoc:
  attr_reader :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end
