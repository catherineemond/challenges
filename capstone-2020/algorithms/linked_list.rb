class Node
  attr_accessor :data, :next_node

  def initialize(data)
    @data = data
  end
end

class LinkedList
  attr_accessor :first_node

  def initialize(first_node)
    @first_node = first_node
  end

  def read(index)
    current_node = first_node
    current_index = 0

    while current_index < index do
      current_node = current_node.next_node
      current_index += 1

      return nil unless current_node
    end

    return current_node.data
  end

  def index_of(value)
    current_node = first_node
    current_index = 0

    while current_node do
      return current_index if current_node.data == value

      current_node = current_node.next_node
      current_index += 1
    end

    return nil
  end

  def insert_at_index(index, value)
    node_to_insert = Node.new(value)

    if index == 0
      node_to_insert.next_node = first_node
      self.first_node = node_to_insert
      return
    end

    current_node = first_node
    current_index = 0

    while current_index < index - 1 do
      current_node = current_node.next_node
      current_index += 1
    end

    node_to_insert.next_node = current_node.next_node
    current_node.next_node = node_to_insert
  end

  def delete_at_index(index)
    if index == 0
      self.first_node = first_node.next_node
      return
    end

    current_node = first_node
    current_index = 0

    while current_index < index - 1 do
      current_node = current_node.next_node
      current_index += 1
    end

    current_node.next_node = current_node.next_node.next_node
  end
end

node1 = Node.new('Once')
node2 = Node.new('upon')

node1.next_node = node2

node3 = Node.new('a')
node4 = Node.new('time')

node2.next_node = node3
node3.next_node = node4

linked_list = LinkedList.new(node1)

p linked_list.read(3) # => 'time'
p linked_list.index_of('time') # => 3

linked_list.insert_at_index(1, 'bozo')
p linked_list.read(1) # => 'bozo'

linked_list.insert_at_index(0, 'clown')
p linked_list.read(0) # => 'clown'
p linked_list.read(1) # => 'Once'

linked_list.delete_at_index(0)
p linked_list.read(0) # => 'Once'

p linked_list.read(1) # => 'bozo'
linked_list.delete_at_index(1)
p linked_list.read(1) # => 'upon'

p linked_list.read(3) # => 'time'
linked_list.delete_at_index(3)
p linked_list.read(3) # => nil