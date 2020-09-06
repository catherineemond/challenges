maximum subarray sum

- input
    - unsorted array with both positive and negative numbers
- output
    - largest sum from any numbers belonging to a contiguous subarray
- example
    [-2, -5, 6, -2, -3, 1, 5, -6] => max sum is 7 from subarray [6, -2, -3, 1, 5]
- approaches
    - naive: two loops checking all possibilities => quadratic
    - divide&conquer: O(NlogN)
- algo (d&q)
  1) divide the given array in two halves
  2) return maximum out of:
    a) max_subarray_sum(left half) (recursive) => simple recursive call
    b) max_subarray_sum(right half) (recursive) => simple recursive call
    c) max subarray sum such that the subarray crosses the midpoint => ???
      - the crossing sum can be found in linear time

#--------------------

The example given has 2 functions:

- max_crossing_sum(arr, left, middle, right) -> linear time
- max_subarray_sum(arr, left right) -> recursive
  - base case -> subarray of one element -> return the element
  - find middle point (middle)
  - return max element out of:
    - max_subarray_sum(arr, left, middle) -> recurse on the left side
    - max_subarray_sum(arr, middle + 1, right) -> recurse on the right side
    - max_crossing_sum(arr, left, middle, right)