# Given a 32-bit signed integer, reverse digits of an integer.

def reverse_num(num)
  new_num = num.abs.digits.join.to_i
  num.positive? ? new_num : -new_num
end

# Another way, without converting to string form at any point:

def reverse_num(num)
  positive = true if num.positive?
  arr = []

  loop do
    first, last = num.abs.divmod(10)
    arr << last
    first > 10 ? num = first : arr << first && break
  end

  total = 0
  arr.each { |num| total = total * 10 + num }
  positive ? total : -total
end

p reverse_num(123) == 321
p reverse_num(-123) == -321
p reverse_num(120) == 21
