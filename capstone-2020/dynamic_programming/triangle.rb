# what's the minimum path from top to bottom
# input seems to be a nested array

# return current_value + MIN from [down_left, down_right]
# DOWN means -> row + 1
# LEFT means -> idx
# RIGHT means -> idx + 1

# base case: I've reached the last row -> input_triangle.length - 1

def minimum_total(triangle, row=0, idx=0, memo={})
  current_value = triangle[row][idx]
  return current_value if row == triangle.length - 1
  
  left = memo[[row + 1, idx]] || minimum_total(triangle, row + 1, idx, memo)
  right = memo[[row + 1, idx + 1]] || minimum_total(triangle, row + 1, idx + 1, memo)
  
  memo[[row, idx]] = current_value + [left, right].min
end