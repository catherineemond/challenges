class CircularBuffer #:nodoc:
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @buffer = []
    @max = size
  end

  def write(el)
    raise BufferFullException if full?
    @buffer << el unless el.nil?
  end

  def write!(el)
    return if el.nil?
    full? ? read && write(el) : write(el)
  end

  def read
    raise BufferEmptyException if @buffer.empty?
    @buffer.shift
  end

  def clear
    @buffer = []
  end

  private

  def full?
    @buffer.size == @max
  end
end
