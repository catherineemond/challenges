# - you are given two unsorted arrays
# - they contain the same numbers, except that in the second array one element is missing

# naive implementation
#  - sort both arrays
#  - iterate until the number at a given index don't match
#  - seems to be O(NlogN) for sorting + O(N) for iterating, space complexity O(1)

def find_difference(ary1, ary2)
  sorted1 = ary1.sort
  sorted2 = ary2.sort

  sorted1.each_with_index do |el, idx|
    return el if el != sorted2[idx]
  end
end

# using a hash table would bring it down to O(N), space complexity tradeoff -> we're creating a new DS, so O(N)

def find_difference(ary1, ary2)
  hash = {}
  ary2.each { |el| hash[el] = true }
  ary1.each { |el| return el if !hash[el] }
end

# hint from interviewer -> find a way to compress the data from the array
# this would be linear, O(N) + no extra space taken -> O(1) space complexity

def find_difference(ary1, ary2)
  ary1.sum - ary2.sum
end

array1 = [3, 6, 8, 12, 4]
array2 = [4, 6, 8, 12]

p find_difference(array1, array2) == 3