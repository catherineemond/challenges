=begin
Write a program that, given a number, can find the sum of all the multiples
of particular numbers up to but not including that number.

If we list all the natural numbers up to but not including 20
that are multiples of either 3 or 5,
we get 3, 5, 6, 9, 10, 12, 15, and 18.
The sum of these multiples is 78.

Write a program that can find the sum of the multiples of a given set of numbers.
If no set of numbers is given, default to 3 and 5.

Notes:
  - seems we need both a class method and an instance method
  - if class method, multiples are [3, 5]
  - if instance method, multiples are given as arguments when instance is created.
=end

class SumOfMultiples
  def initialize(*arg)
    @factors = arg
  end

  def self.to(n)
    new(3, 5).to(n)
  end

  def to(n)
    (1...n).select do |num|
      @factors.any? { |factor| num % factor == 0 }
    end.sum
  end
end

  # first try was:

  # def self.to(n)
  #   multiples_of = [3, 5]
  #   (1...n).each_with_object([]) do |num, arr|
  #     multiples_of.each { |multiple| arr << num if num % multiple == 0 }
  #   end.uniq.sum
  # end
  #
  # def to(n)
  #   (1...n).each_with_object([]) do |num, arr|
  #     @multiples_of.each { |multiple| arr << num if num % multiple == 0 }
  #   end.uniq.sum
  # end
