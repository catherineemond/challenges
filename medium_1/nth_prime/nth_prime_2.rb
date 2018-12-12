class Prime
  @primes = Enumerator.new do |yielder|
    num = 2

    loop do
      yielder << num if is_prime?(num)
      num += 1
    end
  end

  def self.nth(num)
    @primes.take(num).last
  end

  def self.is_prime?(num)
    return false if num == 1

    (2..Math.sqrt(num)).each do |factor|
      return false if num % factor == 0
    end
    true
  end
end
