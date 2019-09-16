# Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
#
# Example:
#
# Input: [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# Output: 6
# Explanation: [4,-1,2,1] has the largest sum = 6.
#
# Follow up:
#
# If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

def max_sub_array(numbers)
  max = numbers[0]

  (1...numbers.size).each do |idx|
    current_sum = numbers[idx] + numbers[idx - 1]
    numbers[idx] = current_sum if current_sum > numbers[idx]
    max = numbers[idx] if numbers[idx] > max
  end

  max
end

numbers = [1, -2, -3, 4, -1, 2, 1, -5, 4]
p max_sub_array(numbers)
