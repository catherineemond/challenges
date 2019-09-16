class Palindromes #:nodoc:
  attr_reader :smallest, :largest

  def initialize(max_factor: 1, min_factor: 1)
    range = (min_factor..max_factor).to_a
    @all_factors = range.product(range).map(&:sort).uniq
    @all_palindromes = []
    @smallest = nil
    @largest = nil
  end

  def generate
    @all_factors.each do |pair|
      product = pair.inject(&:*)
      next unless palindrome?(product)
      if current_palindrome = @all_palindromes.find { |palindrome| palindrome.value == product }
        current_palindrome.factors << pair
      else
        @all_palindromes << new_palindrome = PalindromicNumber.new(product, pair)
        @smallest = new_palindrome if @smallest.nil? || @smallest.value > new_palindrome.value
        @largest = new_palindrome if @largest.nil? || @largest.value < new_palindrome.value
      end
    end
  end

  private

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end
end

class PalindromicNumber #:nodoc:
  attr_reader :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = [factors]
  end
end
