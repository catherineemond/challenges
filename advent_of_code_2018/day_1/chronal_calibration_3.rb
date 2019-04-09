input = File.read('./input.txt')

def convert_to_array(string)
  string.split("\n").map do |str|
    if str[0] == '+'
      str.delete('+').to_i
    else
      -(str.delete('-').to_i)
    end
  end
end

def find_duplicate(string)
  array = convert_to_array(string)
  frequencies = {}
  index = 0
  current_frequency = 0

  loop do
    current_frequency += array[index]
    return current_frequency if frequencies[current_frequency] == 1
    frequencies[current_frequency] = 1
    index += 1
    index = 0 if index == array.size
  end
end

p find_duplicate(input)
