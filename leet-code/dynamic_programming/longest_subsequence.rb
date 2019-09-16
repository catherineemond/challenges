# Given an unsorted array of integers, find the length of longest increasing subsequence.
#
# Example:
#
# Input: [10,9,2,5,3,7,101,18]
# Output: 4
# Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
#
# Note:
#
#   There may be more than one LIS combination, it is only necessary for you to return the length.
#   Your algorithm should run in O(n2) complexity.
#
# Follow up: Could you improve it to O(n log n) time complexity?

def length_of_list(numbers)
  list = numbers.shift

  numbers.each_with_index do |num, idx|
    break if idx == numbers.size - 1

    if numbers[idx + 1] < num
      current_length += 1
    else
      longest_length = current_length if current_length > longest_length
      current_length = 1
    end
  end

  longest_length
end

p length_of_list([10,9,2,5,3,7,101,18])
