def unique_paths(grid)
  # if the first cell is an obstacle immediately return 0 (no possible path)
  return 0 if grid[0][0] == 1

  # set up the scene
  row_last_index = grid[0].length - 1
  column_last_index = grid.length - 1
  grid[0][0] = 1

  # fill in the first row
  1.upto(row_last_index) do |idx|
    grid[0][idx] == 1 ? grid[0][idx] = 0 : grid[0][idx] = grid[0][idx -1 ]
  end

  # fill in the first column
  1.upto(column_last_index) do |idx|
    grid[idx][0] == 1 ? grid[idx][0] = 0 : grid[idx][0] = grid[idx - 1][0]
  end

  # fill in the rest of the matrix based on previous values
  1.upto(column_last_index) do |x|
    1.upto(row_last_index) do |y|
      if grid[x][y] == 1
        grid[x][y] = 0
      else
        grid[x][y] = grid[x - 1][y] + grid[x][y - 1]
      end
    end
  end

  grid[column_last_index][row_last_index]
end
