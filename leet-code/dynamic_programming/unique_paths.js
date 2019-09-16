function uniquePaths(grid) {
  // if the first cell is an obstacle immediately return 0 (no possible path)
  if (grid[0][0] === 1) return 0;

  // set up the scene
  grid[0][0] = 1;

  // fill in the first row
  let rowLength = grid[0].length;

  for (let i = 1; i < rowLength; i += 1) {
    if (grid[0][i] === 1) {
      grid[0][i] = 0;
    } else {
      grid[0][i] = grid[0][i - 1];
    }
  }

  // fill in the first column
  let columnLength = grid.length;

  for (let i = 1; i < columnLength; i += 1) {
    if (grid[i][0] === 1) {
      grid[i][0] = 0;
    } else {
      grid[i][0] = grid[i - 1][0];
    }
  }

  // fill in the rest of the matrix based on previous values
  for (let i = 1; i < columnLength; i += 1) {
    for (let j = 1; j < rowLength; j += 1) {
      if (grid[i][j] === 1) {
        grid[i][j] = 0;
      } else {
        grid[i][j] = grid[i - 1][j] + grid[i][j - 1];
      }
    }
  }

  // return value in thebottom right cell
  return grid[columnLength - 1][rowLength - 1];
}

let grid = [[0, 0, 0], [0, 1, 0], [0, 0, 0]];
console.log(uniquePaths(grid));
