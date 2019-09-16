require 'prime'

def first_try_primes(limit)
  numbers = (2..limit).to_a
  not_primes = []

  numbers.each do |num1|
    next if not_primes.include?(num1)
    (num1..limit).each do |num2|
      next if num1 == num2
      not_primes << num2 if num2 % num1 == 0
    end
  end

  numbers - not_primes
end

def another_primes(limit)
  numbers = (2..limit).to_a
  numbers.each do |prime|
    numbers.reject! { |num| num != prime && num % prime == 0 }
  end
  numbers
end

def optimized_primes(limit)
  numbers = (2..limit).to_a
  not_primes = []

  numbers.each do |num1|
    next if not_primes.include?(num1)
    ((num1 * num1)..limit).each { |num2| not_primes << num2 if num2 % num1 == 0 }
  end

  numbers - not_primes
end

def non_sieve_primes(limit)
  (2..limit).select { |num| prime?(num) }
end

def prime?(number)
  multiples = (1..number).each_with_object([]) do |current_number, multiples|
    multiples << current_number if number % current_number == 0
  end

  multiples.size == 2
end

# p first_try_primes(10)
# p non_sieve_primes(10)
# p optimized_primes(10)
# p another_primes(10)

def benchmark
  start_time = Time.now
  yield
  puts "Seconds: #{Time.now - start_time}"
end

benchmark { p another_primes(100_000) == Prime.entries(100_000) }
