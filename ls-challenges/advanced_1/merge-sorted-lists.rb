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

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]