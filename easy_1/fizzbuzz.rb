=begin
Write a program that prints the numbers from 1 to 100.
But for multiples of three print “Fizz” instead of the number
and for the multiples of five print “Buzz”.
For numbers which are multiples of both three and five print “FizzBuzz”
=end

def fizzbuzz(num)
  array = []

  (1..num).each do |num|
    if num % 3 == 0 && num % 5 == 0
      array << 'FizzBuzz'
    elsif num % 3 == 0
      array << 'Fizz'
    elsif num % 5 == 0
      array << 'Buzz'
    else
      array << num
    end
  end

  puts array.join(', ')
end

fizzbuzz(100)
