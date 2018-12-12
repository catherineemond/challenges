class Prime
  def self.nth(target)
    raise ArgumentError if target < 1
    @primes = [2, 3]

    return @primes[0] if target == 1
    return @primes[1] if target == 2

    @primes << next_prime until @primes.size == target
    @primes.last
  end

  def self.next_prime
    number = @primes.last + 2
    number += 2 until is_prime?(number)
    number
  end

  def self.is_prime?(number)
    for prime in @primes
      return false if number % prime == 0
      return true if prime > Math.sqrt(number)
    end
  end
end

p Prime.nth(100_000)
