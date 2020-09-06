# this was a tough one!
# this solution passes 39/42 of the Leetcode test cases, times out after

def get_maximum_gold(grid)
  max = 0
  rows = grid.length
  columns = grid[0].length

  (0...rows).each do |row|
    (0...columns).each do |col|
      next if grid[row][col] == 0
      current_max = explore(grid, row, col, 0, {})
      max = current_max if current_max > max
    end
  end

  max
end

def explore(grid, row, col, current_total, visited)
  return current_total if invalid_cell?(grid, row, col) || visited[[row, col]]
  
  visited[[row, col]] = true
  
  current_total = current_total + grid[row][col]
  
  left = explore(grid, row, col - 1, current_total, visited)
  right = explore(grid, row, col + 1, current_total, visited)
  up = explore(grid, row - 1, col, current_total, visited)
  down = explore(grid, row + 1, col, current_total, visited)
  
  visited[[row, col]] = false
  
  return [left, right, up, down].max
end

def invalid_cell?(grid, row, col)
  total_rows = grid.length
  total_cols = grid[0].length
  
  row < 0 || col < 0 || row >= total_rows || col >= total_cols || grid[row][col] == 0
end