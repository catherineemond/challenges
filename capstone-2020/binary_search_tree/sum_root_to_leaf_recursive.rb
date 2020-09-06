# recursive approach -> go down until you reach a leaf -> inorder depth first search

def sum_numbers(root)
  return 0 if !root
  dfs(root, 0)
end

def dfs(root, total)
  total = total * 10 + root.val
  return total if is_leaf?(root)
  
  result1 = root.left ? dfs(root.left, total) : 0
  result2 = root.right ? dfs(root.right, total) : 0
  
  result1 + result2
end

def is_leaf?(node)
  !node.left && !node.right
end