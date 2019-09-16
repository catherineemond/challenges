class Trinary
  def initialize(string)
    @digits = valid_input?(string) ? string.chars.map(&:to_i) : [0]
  end

  def to_decimal
    @digits.reverse.map.with_index { |digit, idx| digit * 3.pow(idx) }.sum
  end

  def valid_input?(input)
    input.chars.all?(/[0-2]/)
  end
end
