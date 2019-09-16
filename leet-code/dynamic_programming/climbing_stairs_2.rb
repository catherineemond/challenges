# top-down = recursion

# - first find the base case (where the recursion stops)
# - without memoization, many subproblems are solved over and over (i.e. overlapping)
# - exponential time: we don't want this!
# - memoization to the rescue!

# n = 4
# f(4) = f(3) + f(2)
# f(3) = f(2) + f(1)
# f(2) = f(1) + f(0)
#
# Our base cases: f(0) = 1 and f(n<0) = 0

# The regular recursive solution (without memoization) doesn't pass the test cases on leet code (time limit exceeded)

def climb_stairs(n)
  return 1 if n == 1
  return 2 if n == 2
  climb_stairs(n - 1) + climb_stairs(n - 2)
end

# This one runs in 48ms

def climb_stairs(arr=[0, 1, 2], n)
  return arr[n] if arr[n]
  arr[n] = climb_stairs(arr, n - 1) + climb_stairs(arr, n - 2)
end


#-------------------------------------------------------------------------------
# bottom-up approach

# - basically compute up from the simplest case
# - we use an array to store values

# dp[n] = dp[n - 2] + dp[n - 1]
#
# Our base cases: dp[1] = 1 and dp[2] = 2

# This one runs in 36ms

def climb_stairs(n)
  steps = [0, 1, 2]
  (3..n).each { |x| steps[x] = steps[x - 1] + steps[x - 2] }
  steps[n]
end

#-------------------------------------------------------------------
# This one also runs in 36ms

def climb_stairs(n)
  a = b = 1
  n.times { a, b = b, a + b }
  a
end

p climb_stairs(1) == 1
p climb_stairs(2) == 2
p climb_stairs(3) == 3
p climb_stairs(4) == 5
p climb_stairs(5) == 8
