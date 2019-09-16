def append(ary, n)
  return ary if n < 0
  append(ary, n - 1).unshift(n)
end

# Or:

def append(ary, n)
  return ary if n < 0
  [n] + append(ary, n - 1)
end

# Or:

def append(ary, n)
  return ary if n < 0
  ary << n
  append(ary, n - 1)
end

p append([], 2) #=> [2, 1, 0]
p append([], 3) #=> [3, 2, 1, 0]

#--------------------------------------------------------------

def reverse_append(ary, n)
  return ary if n < 0
  reverse_append(ary, n - 1) << n
end

p reverse_append([], -1)
p reverse_append([], 0)
p reverse_append([], 1)
p reverse_append([], 2)

#----------------------------------------------------------------

def fib(n)
  return 0 if n == 0
  return 1 if n == 1
  fib(n - 1) + fib(n - 2)
end

p fib(0)
p fib(1)
p fib(2)
p fib(3)
p fib(4)
p fib(10)
