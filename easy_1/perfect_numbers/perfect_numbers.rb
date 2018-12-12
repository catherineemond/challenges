=begin
input: positive integer
output: a string, describing the integer as perfect, deficient or abundant

notes:
  - if the number is < 0, raise Runtime Error
  - we have to consider the sum of positive divisors,
    excluding the number itself, but including 1
  - if that sum is == to the num => perfect
  - if that sum is < than the num => deficient
  - if that sum is > than the num => abundant
=end

class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num < 1
    sum = sum_of_divisors(num)

    case
    when sum == num then 'perfect'
    when sum <  num then 'deficient'
    when sum >  num then 'abundant'
    end
  end

  def self.sum_of_divisors(num)
    return 0 if num == 1
    (1...num).reduce { |sum, divisor| num % divisor == 0 ? sum + divisor : sum }
  end

  # OR (I think using select makes it clearer):

  def self.sum_of_divisors(num)
    return 0 if num == 1
    (1...num).select { |divisor| num % divisor == 0 }.sum
  end
end
