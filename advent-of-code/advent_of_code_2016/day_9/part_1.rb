def decompress(input)
  tokens = input.scan(/[A-Z]|\(\d+x\d+\)/)
  message = ''

  until tokens.empty? do
    current_token = tokens.shift

    if current_token.match(/[A-Z]/)
      message += current_token
    else
      length, times = current_token.scan(/\d+/).map(&:to_i)
      chars = take_slice(tokens, length)
      message += (chars * times)
    end
  end

  message.length
end

def take_slice(tokens, length)
  slice = ''

  while slice.length < length do
    slice += tokens.shift
  end

  slice
end

input = File.read('input.txt').chomp
p decompress(input)

# p decompress('ADVENT') # => ADVENT => 6
# p decompress('A(1x5)BC') # => ABBBBBC => 7
# p decompress('(3x3)XYZ') # => XYZXYZXYZ => 9
# p decompress('A(2x2)BCD(2x2)EFG') # => ABCBCDEFEFG => 11
# p decompress('(6x1)(1x3)A') # => (1x3)A => 6
# p decompress('X(8x2)(3x3)ABCY') # => X(3x3)ABC(3x3)ABCY => 18
