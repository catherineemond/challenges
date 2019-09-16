# You are climbing a stair case. It takes n steps to reach the top (this is our target number)
#
# Each time you can climb 1 or 2 steps.
#
# In how many distinct way can you climb to the top?
#
# In other words which combinations of 1 and 2 can give me the target number?
#
# Can be formalized as f(n) = f(n - 1) + f(n - 2)

#-------------------------------------------------------------------
# first try, with magic ruby method:

# def climb_stairs(n)
#   solutions = 0
#
#   n.times do |num|
#     [1, 2].repeated_permutation(num + 1).each do |combination|
#       solutions += 1 if combination.sum == n
#     end
#     break if num + 1 == n
#   end
#
#   solutions
# end

#----------------------------------------------------------------
# recursive solution:

# def climb_stairs(n)
#   recursive_climb(0, n) # we start at zero step
# end
#
# def recursive_climb(step, total)
#   if step > total
#     return 0
#   elsif step == total
#     return 1
#   end
#
#   recursive_climb(step + 1, total) + recursive_climb(step + 2, total)
# end

#-------------------------------------------------------------------
# recursion with memoization:

#-------------------------------------------------------------------
# Dynamic Programming:

# What more general problem can I solve?
# finding the number of solutions for a given number of steps f(n) will always be equal to f(n-1) (if I take one step) + f(n-2) (if I take two steps)
# formula: f(n) = f(n-1) + f(n-2) (fibonacci!)
# base case: f(0) = f(1) = 1

def climb_stairs(n)
  return 1 if n <= 1
  climb_stairs(n - 1) + climb_stairs(n - 2)
end

#-------------------------------------------------------------------
# top down

#-------------------------------------------------------------------
# bottom up, storing values in an array as we go

def climb_stairs(n)
  results = [1, 1]
  (2..n).each { |step| results[step] = results[step - 1] + results[step - 2] }
  results[n]
end

#-------------------------------------------------------------------
# Even simpler:

# def climb_stairs(n)
#   a = b = 1
#   n.times { a, b = b, a+b }
#   a
# end


p climb_stairs(1) == 1
p climb_stairs(2) == 2
p climb_stairs(3) == 3
p climb_stairs(4) == 5
p climb_stairs(5) == 8
