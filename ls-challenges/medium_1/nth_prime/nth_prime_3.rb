class Prime
  def self.nth(num)
    raise ArgumentError if num < 1

    @primes = [2]
    current_number = 3

    loop do
      return @primes.last if @primes.size == num

      if is_prime?(current_number)
        @primes << current_number
      end

      current_number += 2
    end
  end

  # Good refactoring, we only need to check if the prime numbers smaller than
  # sqr root of given num are factors.

  def self.is_prime?(num)
    @primes.each do |prime|
      return false if num % prime == 0
      break if prime > Math.sqrt(num)
    end

    true
  end
end

p Prime.nth(100_000)
