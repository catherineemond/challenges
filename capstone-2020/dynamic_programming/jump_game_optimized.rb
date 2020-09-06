# optimized solution derived from my first one, passes all test cases on LeetCode
# time complexity -> O(N**2) -> double loop -> we loop over each element and then again to mark all following el.
# space complexity -> O(N) -> the memo will have a length == to the input array

def can_jump(nums)
  last_index = nums.length - 1
  
  # initialize an array, equal in length to the input array, to store booleans 
  memo = Array.new(nums.length)
  # the first element can always be reached, even with zero jump
  memo[0] = true
  # optimization -> mark out the first series of jump
  (1..nums[0]).each { |jump| memo[jump] = true }
  # start from the beginnings
  current = 0
  
  while current < last_index do
    return false unless memo[current] # if the current position cannot be reached
    current += 1
    
    next if nums[current - 1] > nums[current] # if the previous value was greater, no need to mark -> redundant work
    
    (1..nums[current]).each { |jump| memo[current + jump] = true }
  end
  
  !!memo[last_index]
end