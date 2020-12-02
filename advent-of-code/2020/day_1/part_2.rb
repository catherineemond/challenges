input = File.read('./input.txt').split("\n").map(&:to_i)

def find_match(input)
  input.combination(3).to_a.find { |arr| arr.sum == 2020 }.reduce(:*)
end

p find_match(input)