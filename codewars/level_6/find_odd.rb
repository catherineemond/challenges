# Given an array, find the int that appears an odd number of times.
# There will always be only one integer that appears an odd number of times.
#------------------------------------------------------------------------------
# input: an array, of which only one element appears an odd number of times

# output: an integer, the element that appears an odd number of times

# I can probably use #find, #count and #odd? to solve this

def find_it(arr)
  arr.find { |n| arr.count(n).odd? }
end

p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
p find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
p find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
p find_it([10]) == 10
p find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10
