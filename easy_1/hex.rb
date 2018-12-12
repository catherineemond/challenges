# 16 chars
# case insensitive
# string input to decimal equivalent

HEX_CHARS = ('0'..'9').to_a + ('a'..'f').to_a

def to_decimal(hex_string)
  digits = convert_to_digits(hex_string.downcase)
  digits.reverse.map.with_index { |digit, idx| digit * 16.pow(idx) }.sum
end

def convert_to_digits(hex_string)
  return [0] unless valid_input?(hex_string)
  digits = hex_string.downcase.chars.map { |char| HEX_CHARS.index(char) }
end

def valid_input?(input)
  input.chars.all? { |char| HEX_CHARS.include?(char) }
end

p to_decimal('F') == 15
p to_decimal('10') == 16
p to_decimal('1B') == 27
p to_decimal('30') == 48
p to_decimal('F0') == 240
p to_decimal('400') == 1024
p to_decimal('xyz') == 0
