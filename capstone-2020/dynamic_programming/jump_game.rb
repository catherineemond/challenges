# First solution - outlined together
# it passes all test cases except one (the last one) -> times out

def can_jump(nums)
  last_index = nums.length - 1
  memo = Array.new(nums.length)
  memo[0] = true
  
  nums.each_with_index do |n, idx|
    return false unless memo[idx]
    
    (1..n).each { |jump| memo[idx + jump] = true }
  end
  
  !!memo[last_index]
end