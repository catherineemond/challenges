input = File.read('./input.txt')

# First try:

def calibrate(string)
  string.split("\n").map do |str|
    if str[0] == '+'
      str.delete('+').to_i
    else
      -(str.delete('-').to_i)
    end
  end.sum
end

# Second try:

def calibrate(string)
  string.split("\n").map { |str_num| eval(str_num) }.sum
end

p calibrate(input)
