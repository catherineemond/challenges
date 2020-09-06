# if not recursion -> need to use a stack

def preorder_traversal(root)
  stack = []
  result = []
  current = root
  
  while current
    result << current.val
    stack << current.right if current.right
    
    if current.left
      current = current.left
    else
      current = stack.pop
    end
  end
  
  result
end