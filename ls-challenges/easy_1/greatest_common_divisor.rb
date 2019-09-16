# Build a method that will return the greatest common divisor
# between two positive integers

# find common divisors
# find the greatest

def greatest_common_divisor(x, y)
  first, second = [x, y].sort
  (1..first).each_with_object([]) do |num, common_divisors|
    common_divisors << num if first % num == 0 && second % num == 0
  end.max
end

# Better: starting from the greatest possible and returning as soon as a common divisor is found

def greatest_common_divisor(x, y)
  smallest_num = [x, y].min
  smallest_num.downto(1) do |num|
    return num if x % num == 0 && y % num == 0
  end
end

# Shorter:

def greatest_common_divisor(x, y)
  [x, y].min.downto(1).find { |num| x % num == 0 && y % num == 0 }
end

p greatest_common_divisor(9, 15) == 3
p greatest_common_divisor(100, 11) == 1
p greatest_common_divisor(14, 28) == 14
