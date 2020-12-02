input = File.read('./input.txt').split("\n").map(&:to_i)

def find_match(input)
  input.each do |i|
    input.each do |j|
      next if i == j
      return i * j if i + j == 2020
    end
  end
end

p find_match(input)
