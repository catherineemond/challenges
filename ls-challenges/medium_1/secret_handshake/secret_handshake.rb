=begin
1 = wink
10 = double blink
100 = close your eyes
1000 = jump


10000 = Reverse the order of the operations in the secret handshake.

handshake = SecretHandshake.new 9
handshake.commands # => ["wink","jump"]

handshake = SecretHandshake.new "11001"
handshake.commands # => ["jump","wink"]

The program should consider strings specifying an invalid binary
as the value 0.

Notes:
  - should I work with a string representation or integer?
    => my first try was with integer representation, see below
    => actually much simpler to work with a string, see secret_handshake_2.rb
    => another problem with this first try is that I treat the binary number as a decimal
      in order to perform integer operations on it.

  - strings representing digits are ok (should be converted to_i)
    => seems to already be string representation of binary num, no need to convert

  - other strings are considered invalid and should be converted to 0
  - I have to separate the units, tens, hundreds amd thousands
=end

class SecretHandshake
  def initialize(input)
    @binary_number = convert_to_binary(input)
    @reverse = true
    @commands = []
  end

  def commands
    divisor = 10000
    number = @binary_number

    loop do
      first, number = number.divmod(divisor)
      secret_action(divisor) if first == 1
      divisor /= 10
      break if divisor == 0
    end

    @reverse ? @commands.reverse : @commands
  end

  private

  def convert_to_binary(input)
    case input
    when Integer then input < 32 ? input.to_s(2).to_i : 0 # making sure the converted binary has the right amount of digits
    when String  then input.match?(/\d+/) ? input.to_i : 0
    end
  end

  def secret_action(divisor)
    case divisor
    when 10000 then @reverse = false
    when 1000  then @commands << 'jump'
    when 100   then @commands << 'close your eyes'
    when 10    then @commands << 'double blink'
    when 1     then @commands << 'wink'
    end
  end
end
