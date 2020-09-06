def average_of_levels(root)
  queue = []
  result = []
  queue << root
  
  while !queue.empty?
    level = []

    queue.length.times do
      node = queue.shift
      queue << node.left if node.left
      queue << node.right if node.right
      level << node.val
    end
    
    result << (level.sum.to_f / level.length)
  end
  
  result
end