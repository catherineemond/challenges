# Short & sweet but lacking the square root optimization

class Prime
  def self.nth(target)
    raise ArgumentError if target < 1

    (2..Float::INFINITY).each_with_object([]) do |num, primes|
      primes << num unless primes.any? { |prime| num % prime == 0 }

      return primes.last if primes.size == target
    end
  end
end
