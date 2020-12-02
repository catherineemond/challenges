def merge_sort(array)
  return array if array.length == 1
  
  middle = array.length / 2
  left = array[0...middle]
  right = array[middle..-1]

  merge(merge_sort(left), merge_sort(right))
end

def merge(a, b)
  result = []
  a_idx = 0
  b_idx = 0

  while a_idx < a.length && b_idx < b.length do
    if a[a_idx] < b[b_idx]
      result << a[a_idx]
      a_idx += 1
    else
      result << b[b_idx]
      b_idx += 1
    end
  end

  while a_idx < a.length do
    result << a[a_idx]
    a_idx += 1
  end

  while b_idx < b.length do
    result << b[b_idx]
    b_idx += 1
  end

  result
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]