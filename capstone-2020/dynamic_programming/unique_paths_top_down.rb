# top-down -> you start with the formula
# in this case: the number of paths for a given cell will be the SUM of # of paths for adjacent cells
# our base case -> when we're on the first row or first column (one possible path)
# add memoization to avoid recomputing subproblems and improve efficiency

def unique_paths(m, n, memo={[1,1] => 1})
  return 1 if m == 1 || n == 1
  return memo[[m,n]] if memo[[m,n]]
  memo[[m,n]] = unique_paths(m-1, n, memo) + unique_paths(m, n-1, memo)
end