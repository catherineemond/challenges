class Node
  attr_accessor :data, :next_node, :previous_node

  def initialize(data)
    @data = data
  end
end

class DoublyLinkedList
  attr_accessor :first_node, :last_node

  def initialize(first_node=nil, last_node=nil)
    @first_node = first_node
    @last_node = last_node
  end

  def insert_at_end(value)
    new_node = Node.new(value)

    if !first_node
      self.first_node = new_node
      self.last_node = new_node
    else
      new_node.previous_node = last_node
      last_node.next_node = new_node
      self.last_node = new_node
    end
  end

  def remove_from_front
    removed_node = first_node
    self.first_node = first_node.next_node

    return removed_node
  end
end
