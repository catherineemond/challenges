=begin
input: a string of digits
output: all consecutive number series of length n in that string

questions:
  - are the string numbers always ordered?
    => they're not ordered and it doesn't matter
  - what should the method return / output ? (array?, output the strings?)
    => a nested array containing integers

notes:
  - The method should raise an ArgumentError if n is greater than the number of chars in the string
=end

class Series
  def initialize(string_number)
    @string_number = string_number
  end

  def slices(count)
    raise ArgumentError, 'Argument given greater than original string' if count > @string_number.length
    numbers = @string_number.chars.map(&:to_i)
    numbers.each_cons(count).with_object([]) { |serie, object| object << serie }
    # could also be (calling to_a on the Enumerator object):
    # numbers.each_cons(count).to_a
  end

  # How I would do it without #each_cons:

  def slices(count)
    raise ArgumentError, 'Argument given greater than original string' if count > @string_number.length
    numbers = @string_number.chars.map(&:to_i)

    numbers.each_index.with_object([]) do |index, slices|
      break slices if index > (numbers.size - count)
      slices << numbers[index, count]
    end
  end
end
