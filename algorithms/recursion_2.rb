def factorial(num)
  (1..num).reduce(:*)
end

def recursive_factorial(num)
  return num if num == 1
  num * factorial(num - 1)
end

p recursive_factorial(5)
