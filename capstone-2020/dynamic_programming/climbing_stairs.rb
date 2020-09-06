# we avoid recomputing the overlapping sub-problems -> O(N) time complexity
# space complexity -> O(N) -> the memo (the array used in second solution)
# not sure about the space complexity of the first one, probably O(1)?

def climb_stairs(n)
  return 1 if n == 1
  
  first = 1
  second = 2
  
  (n - 2).times do
    temp = first
    first = second
    second = temp + first
  end
  
  second
end

#--------------------------------------

def climb_stairs(n)
  memo = [0, 1, 2]
  return memo[n] if n <= 2
  
  (3..n).each do |idx|
    memo[idx] = memo[idx - 1] + memo[idx - 2]
  end
  
  memo[n]
end