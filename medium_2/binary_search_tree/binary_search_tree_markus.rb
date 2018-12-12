class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(new_data)
    if new_data <= @data
      @left ? @left.insert(new_data) : @left = Bst.new(new_data)
    else
      @right ? @right.insert(new_data) : @right = Bst.new(new_data)
    end
  end

  def each
    result = []
    traverse(self, result)
    block_given? ? result.each { |data| yield data } : result.each
  end

  def traverse(node, result)
    return if node == nil
    traverse(node.left, result)
    result << node.data
    traverse(node.right, result)
  end
end
