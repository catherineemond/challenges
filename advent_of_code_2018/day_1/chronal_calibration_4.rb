input = File.read('./input.txt')

def convert_to_array(string)
  string.split("\n").map { |str_num| eval(str_num) }
end

def find_duplicate(string)
  frequency_changes = convert_to_array(string)
  frequencies = {}
  index = 0
  current_frequency = 0

  loop do
    current_frequency += frequency_changes[index]
    return current_frequency if frequencies[current_frequency] == 1
    frequencies[current_frequency] = 1
    index += 1
    index = 0 if index == frequency_changes.size
  end
end

p find_duplicate(input)
