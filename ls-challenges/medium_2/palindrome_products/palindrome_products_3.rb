class Palindromes #:nodoc:
  def initialize(max_factor: 1, min_factor: 1)
    range = (min_factor..max_factor).to_a
    all_factors = range.product(range).map(&:sort).uniq
    @palindromes_with_factors = find_all_factors_for_palindromes(all_factors)
  end

  def generate
    @palindromes = []
    @palindromes_with_factors.each do |product, factors|
      @palindromes << PalindromicNumber.new(product, factors)
    end
  end

  def largest
    @palindromes.max
  end

  def smallest
    @palindromes.min
  end

  private

  def find_all_factors_for_palindromes(factors)
    palindromes = Hash.new { |hash, key| hash[key] = [] }
    factors.each do |pair|
      product = pair.inject(&:*)
      next unless palindrome?(product)
      palindromes[product] << pair
    end
    palindromes
  end

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end
end

class PalindromicNumber #:nodoc:
  attr_reader :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = factors
  end

  def <=>(other)
    value <=> other.value
  end
end
