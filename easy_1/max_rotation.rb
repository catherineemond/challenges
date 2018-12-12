=begin
- rotation means first number becomes last:
  735291 => 352917
- then we ignore the first number (index 0) and rotate again
  3-52917 => 3-29175
- then we ignore the first two numbers (index 0-1) and rotate:
  32-9175 => 32-1759
- ...
  321-759 => 321-597
- ...
  3215-97 => 3215-79 : this is the maximum rotation.

input: integer
output: integer, the max rotation of the original number
data structure:
  - array allows easy manipulation of separate digits
  - str representation of the digits will also make it easier
  - in the end just need to convert str to integer
algorithm:
  - define a rotate method that shift and add the first number
=end

def max_rotation(num)
  digits = num.to_s.chars
  new_digits = []

  loop do
    rotate(digits)
    new_digits << digits.shift
    break if digits.empty?
  end

  new_digits.join.to_i
end

def rotate(array)
  array << array.shift
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(53) == 35
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845
