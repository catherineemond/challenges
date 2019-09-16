module RunLengthEncoding
  def self.encode(input)
    count = 1
    previous_char = input.chars.first
    encoded_string = ''

    input.chars.each_with_index do |char, index|
      next if index == 0

      if char != previous_char
        encoded_string << "#{count == 1 ? '' : count}#{previous_char}"
        encoded_string << char if index == input.length - 1
        count = 1
      else
        count += 1
        encoded_string << "#{count == 1 ? '' : count}#{char}" if index == input.length - 1
      end

      previous_char = char
    end

    encoded_string
  end

  def self.decode(input)
    count_char_pairs = input.scan(/([0-9]*)([^0-9])/)
    count_char_pairs.each_with_object('') do |pair, string|
      count = pair[0].to_i
      count = 1 if count == 0
      char = pair[1]

      count.times { string << char }
    end
  end
end
