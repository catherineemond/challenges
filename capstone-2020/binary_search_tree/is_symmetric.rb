def is_symmetric(root) 
  return true if !root
  
  left, right = root.left, root.right
  compare(left, right)
end

def compare(left, right)
  return true if !left && !right
  return false if !left || !right
  return false if left.val != right.val
  
  compare(left.left, right.right) && compare(left.right, right.left)
end