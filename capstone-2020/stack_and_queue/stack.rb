# work in progress, to be completed

1 -> 2 -> 3

class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
  end
end

class Stack
  attr_reader :length
  
  def initialize
    @top = nil
    @length = 0
  end

  def push(data)
    node = Node.new(data)

    if !@top
      @top = node
    else
      node.next = @top
      @top = node
    end

    @length += 1
  end

  def pop
    return nil if empty?
    
    value = @top.data
    @top = @top.next
    @length -= 1

    value
  end

  def peek
    @top.data
  end

  def empty?
    length == 0
  end
end