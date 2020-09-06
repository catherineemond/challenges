# https://leetcode.com/problems/insert-into-a-binary-search-tree/

def insert_into_bst(root, val)
  return TreeNode.new(val) if !root
  
  if root.val < val
    if !root.right
      root.right = TreeNode.new(val)
    else
      insert_into_bst(root.right, val)
    end
  else
    if !root.left
      root.left = TreeNode.new(val)
    else
      insert_into_bst(root.left, val)
    end
  end
  
  root
end