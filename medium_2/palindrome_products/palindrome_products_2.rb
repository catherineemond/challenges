class Palindromes #:nodoc:
  def initialize(max_factor: 1, min_factor: 1)
    @range = (min_factor..max_factor).to_a
    @factors = @range.product(@range).map(&:sort).uniq
  end

  def generate
    @palindromes = @factors.each_with_object({}) do |factors, palindromes|
      product = factors.inject(&:*)
      next unless palindrome?(product)
      if palindromes[product]
        palindromes[product] << factors
      else
        palindromes[product] = [factors]
      end
    end
  end

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end

  def largest
    max = @palindromes.keys.max
    max_factors = @palindromes[max]
    PalindromicNumber.new(max, max_factors)
  end

  def smallest
    min = @palindromes.keys.min
    min_factors = @palindromes[min]
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
