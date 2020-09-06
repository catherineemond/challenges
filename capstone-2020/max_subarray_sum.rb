# this is the recursive function

def max_subarray_sum(array, left=0, right=(array.length - 1))
  # base case
  return array[left] if left == right
  # get the middle
  middle = (left + right) / 2
  # return the max out of the three following possibilities
  return [
    max_subarray_sum(array, left, middle),
    max_subarray_sum(array, middle + 1, right),
    max_crossing_sum(array, left, middle, right)
  ].max
end

# this helper function searches linearily
# it starts from the middle and gradually checks the left/right boundaries

def max_crossing_sum(array, left, middle, right)
  sum = 0
  left_sum = -Float::INFINITY
  index = middle

  while index >= left do
    sum += array[index]
    left_sum = sum if sum > left_sum
    index -= 1
  end

  sum = 0
  right_sum = -Float::INFINITY
  index = middle + 1

  while index <= right do
    sum += array[index]
    right_sum = sum if sum > right_sum
    index += 1
  end
  # possible edge case of [-2, 1]
  [(left_sum + right_sum), left_sum, right_sum].max
end

p max_subarray_sum([2, 3, 4, 5, 7])