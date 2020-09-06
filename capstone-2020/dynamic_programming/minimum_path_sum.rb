# following the same bottom up approach as the unique path problem
# passes all test cases on LeetCode
# time complexity -> O(M*N) -> we traverse the grid
# space complexity -> O(1) -> we overwrite the values in the grid itself, no extra space needed

# similar to previous problem 
# # BUT:
#   - the input is a grid -> nested array
#   - walking the grid we need to use the VALUES in each cell
# store in each cell the MINIMUM value
  # - add current value to both adjacent cells
  # - compare the numbers
  # - store the smallest number in that cell
  # - work your way towards the right-down corner
# ^^ that would be a bottom-up approach

# top-down: what's the magic formula??
#  - we're working with a grid
#  - if we want to use recursion, we need to pass in a grid

def min_path_sum(grid)
  rows = grid.length - 1
  columns = grid[0].length - 1
  
  # set up -> fill in the first row and the first column for easier logic afterwards
  (1..columns).each { |col| grid[0][col] = grid[0][col] + grid[0][col - 1] }
  (1..rows).each { |row| grid[row][0] = grid[row][0] + grid[row - 1][0] }
  
  # fill in the rest of the grid with minimum values
  (1..rows).each do |row|
    (1..columns).each do |col|
      value = grid[row][col]
      left = grid[row][col - 1]
      up = grid[row - 1][col]
      grid[row][col] = left > up ? (value + up) : (value + left)
    end
  end
  
  grid[rows][columns]
end