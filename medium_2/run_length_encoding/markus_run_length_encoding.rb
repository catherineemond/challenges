require 'pry'

module RunLengthEncoding
  extend self

  def encode(input)
    result = ''
    input.each_char.chunk { |ch| ch }.each do |group|
      binding.pry
      result << "#{group[1].size if group[1].size > 1}#{group[0]}"
    end
    result
  end

  def decode(input)
    decompressed = input.scan(/(\d{0,})(.)/).map do |group|
      group[1] * group[0].ljust(1, "1").to_i
    end
    decompressed.join
  end
end

input = 'AABBBCCCC'
p RunLengthEncoding.encode(input)
