def level_order(root)
  return [] if !root
  
  result = []
  queue = []
  queue << root
  
  while !queue.empty?
    level = []
    
    queue.length.times do
      node = queue.shift
      level << node.val
      queue << node.left if node.left
      queue << node.right if node.right
    end
    
    result << level
  end
  
  result
end