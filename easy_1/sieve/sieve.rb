# a prime is divisible only by 1 and itself
# the return value of the #primes method should be an array of prime integers

# I chose to 'mark' them by making an array of not_primes.
# A simpler solution is to delete the non-prime numbers from the initial array,
# deleting them being seen as a way to 'mark' them.

# See playing_with_primes file for more solutions.

class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    numbers = (2..@limit).to_a
    not_primes = []

    numbers.each do |num1|
      next if not_primes.include?(num1)
      (num1.pow(2)..@limit).each { |num2| not_primes << num2 if num2 % num1 == 0 }
    end

    numbers - not_primes
  end
end
