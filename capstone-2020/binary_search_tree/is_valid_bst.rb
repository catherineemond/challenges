def is_valid_bst(root, min = -Float::INFINITY, max = Float::INFINITY)
  # base cases
  
  return true if !root
  return false if root.val >= max || root.val <= min
  
  # divide
  
  left, right = root.left, root.right
  
  # recurse (conquer)
  
  left_result = is_valid_bst(left, min, root.val)
  right_result = is_valid_bst(right, root.val, max)
  
  
  # combine -> the two need to be valid
  
  left_result && right_result
end