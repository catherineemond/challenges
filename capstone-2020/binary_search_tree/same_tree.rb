def is_same_tree(p, q)
  # base cases
    
  return true if !p && !q
  return false if !p || !q
  return false if p.val != q.val
  
  # divide
  
  p_left, p_right = p.left, p.right
  q_left, q_right = q.left, q.right
  
  # recurse (conquer)
  
  left_result = is_same_tree(p_left, q_left) 
  right_result = is_same_tree(p_right, q_right)
  
  
  # combine 
  
  left_result && right_result
end