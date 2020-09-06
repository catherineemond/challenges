def find_number(ary, num)
  find_number_helper(ary, num, 0, ary.length - 1)
end

def find_number_helper(ary, num, start_index, end_index)
  if start_index == end_index
    return ary[end_index] == num ? end_index : -1
  end

  middle = (start_index + end_index) / 2

  left = find_number_helper(ary, num, start_index, middle)
  right = find_number_helper(ary, num, middle+1, end_index)

  if left == -1 && right == -1 
    -1 
  elsif left != -1 
    left 
  else 
    right 
  end
end

p find_number([1,4,6,8], 8)