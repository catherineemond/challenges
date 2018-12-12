=begin
- write a program that can tell you what the nth prime is
-[2, 3, 5, 7, 11, 13] are the first 6 prime numbers
- I would like to try and solve this with an enumerator

notes : - this is not exactly index base, more index + 1
        - an argument < 1 should return an ArgumentError

questions:
  - does it make a significant difference to store all primes in an array up to
    the wanted index, or save just a given number like I did here?
=end

class Prime
  def self.nth(num)
    raise ArgumentError if num < 1

    nth_prime = nil
    current_number = 2
    count = 0

    loop do
      if is_prime?(current_number)
        nth_prime = current_number
        count += 1
        return nth_prime if count == num
      end

      current_number == 2 ? current_number += 1 : current_number += 2
    end
  end

  def self.is_prime?(num)
    (2..Math.sqrt(num)).each do |factor|
      return false if num % factor == 0
    end
    true
  end
end
