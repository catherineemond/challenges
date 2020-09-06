def preorder_traversal(root)
  result = []
  dfs_helper(root, result)
end

def dfs_helper(root, result)
  return result if root.nil?
  result << root.val
  left = dfs_helper(root.left, result)
  right = dfs_helper(root.right, result)
  result
end