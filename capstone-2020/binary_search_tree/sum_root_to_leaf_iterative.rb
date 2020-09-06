# iterative approach -> push the complexity to the data structure

def sum_numbers(root)
  return 0 if !root
  
  stack = []
  stack << {node: root, current_total: 0}
  total = 0
  
  while !stack.empty?
    obj = stack.pop
    current_total = obj[:current_total]
    node = obj[:node]
    
    current_total = current_total * 10 + node.val
    
    if !node.left && !node.right
      total += current_total
    end
    
    stack << {node: node.left, current_total: current_total} if node.left
    stack << {node: node.right, current_total: current_total} if node.right
  end
  
  total
end