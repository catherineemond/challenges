def invert_tree(root)
  # base cases
  
  return root if !root
  
  # divide & conquer
   
  left = invert_tree(root.left)
  right = invert_tree(root.right)
  
  # combine
  
  root.left = right
  root.right = left
  
  root
end