class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value, left=nil, right=nil)
    self.value = value
    self.left = left
    self.right = right
  end
end

class BinaryTree
  def initialize(root)
    @root = root
  end

  def search(value, node=@root)
    return node if node.nil? || node.value == value

    if value < node.value
      search(value, node.left)
    else
      search(value, node.right)
    end
  end

  def insert(value, node=@root)
    if value < node.value
      node.left ? insert(value, node.left) : node.left = TreeNode.new(value)
    elsif value > node.value
      node.right ? insert(value, node.right) : node.right = TreeNode.new(value)
    end
  end

  def delete(value, node=@root)
    return nil unless node

    if value < node.value
      node.left = delete(value, node.left)
    elsif value > node.value
      node.right = delete(value, node.right)
    elsif value == node.value
      return node.right unless node.left
      return node.left unless node.right
      node.right = lift(node.right, node)
    end
  end

  def lift(node, node_to_delete)
    if node.left
      node.left = lift(node.left, node_to_delete)
      return node
    else
      node_to_delete.value = node.value
      return node.right
    end
  end

  def traverse_and_print(node=@root)
    return unless node

    traverse_and_print(node.left)
    p node.value
    traverse_and_print(node.right)
  end
end

node1 = TreeNode.new(1)
node2 = TreeNode.new(10)
root = TreeNode.new(4, node1, node2)

binary_tree = BinaryTree.new(root)

binary_tree.insert(2)
binary_tree.insert(5)
binary_tree.insert(3)
binary_tree.insert(12)
binary_tree.traverse_and_print