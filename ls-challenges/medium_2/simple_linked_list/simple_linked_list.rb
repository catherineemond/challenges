class Element
  attr_reader :datum, :next

  def initialize(datum, next_element=nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next == nil
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def size
    count = 0
    current = @head

    loop do
      break unless current
      count += 1
      current = current.next
    end

    count
  end

  def push(datum)
    if empty?
      @head = Element.new(datum)
    else
      previous_head = @head
      @head = Element.new(datum, previous_head)
    end
  end

  def pop
    previous_head = @head
    @head = @head.next
    previous_head.datum
  end

  def empty?
    size == 0
  end

  def peek
    @head&.datum
  end

  def to_a(result=[], element=@head)
    result << element.datum if element
    return result if element&.next.nil?
    to_a(result, element.next)
  end


  def self.from_a(array)
    array ||= []
    array.reverse.each_with_object(SimpleLinkedList.new) { |element, list| list.push(element) }
  end

  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end
end
