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

  message
end

def take_slice(tokens, length)
  slice = ''

  while slice.length < length do
    slice += tokens.shift
  end

  return decompress(slice) if slice.match?(/\(\d+x\d+\)/)
  slice
end

input = File.read('input.txt').chomp
p decompress(input).length

# p decompress('(3x3)XYZ').length # => XYZXYZXYZ => 9
# p decompress('X(8x2)(3x3)ABCY').length # => XABCABCABCABCABCABCY => 20
# p decompress('(27x12)(20x12)(13x14)(7x10)(1x12)A').length # => A... => 241920
# p decompress('(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN').length # => 445
