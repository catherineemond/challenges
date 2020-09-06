def merge_sort(nums)
  return nums if nums.length == 1 # base case
  
  middle = nums.length / 2
  left = nums[0..middle - 1]
  right = nums[middle..-1]
  
  left_sorted = merge_sort(left)
  right_sorted = merge_sort(right)
  
  merge(left_sorted, right_sorted)
end

def merge(first, second)
  merged = []
  
  while !first.empty? && !second.empty? do
    if first[0] < second[0]
      merged.push(first.shift)
    else
      merged.push(second.shift)
    end
  end
  
  merged.concat(first) unless first.empty?
  merged.concat(second) unless second.empty?
  
  merged
end

p merge_sort([5,2,3,1]) == [1, 2, 3, 5]