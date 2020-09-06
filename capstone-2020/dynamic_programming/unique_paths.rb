# time complexity -> O(M*N) (all the grid values)
# space complexity -> O(M*N) (all the grid values)

def unique_path(rows, columns)
  # build the grid
  grid = Array.new(rows)
  grid.map! { |row| Array.new(columns) }
  
  # populate the first column
  rows.times { |row| grid[row][0] = 1 }

  # populate the first row
  columns.times { |col| grid[0][col] = 1 }
  
  # populate the whole grid
  (1...rows).each do |row|
    (1...columns).each do |col|
      grid[row][col] = grid[row - 1][col] + grid[row][col - 1]
    end
  end

  # return the value for down-right corner
  grid[rows - 1][columns - 1]
end

p unique_path(7, 3)
