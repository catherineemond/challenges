=begin
input : octal string
output: decimal integer

notes:
  - implement the conversion yourself
  - treat invalid input as octal 0
  - what if the number ends with zero?
  - what if the number starts with zero?
  - octal numbers cannot end in 8 or 9 (only 8 digits, from 0 to 7)
    => considered invalid input

algorithm:
  - from string to chars to integer : '233' => ['2', '3', '3'] => [2, 3, 3]
  - reverse the order so that the power needed will correspond with the index
  - iterate on the array, possibly with map.with_index to return a new_array of converted values
  - use array sum to sum those values and get the answer
=end

class Octal
  def initialize(string)
    @digits = valid_input?(string) ? string.chars.map(&:to_i) : [0]
  end

  def to_decimal
    @digits.reverse.map.with_index { |digit, idx| digit * 8.pow(idx) }.sum
  end

  def valid_input?(input)
    input.chars.all?(/[0-7]/)
  end
end
