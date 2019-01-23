class NQueens
  attr_reader :solutions

  def initialize(n)
    @n = n
    @solutions = []
  end

  def search(board, y)
    @solutions << board.map { |q| [q.x, q.y].join(',') }.join('->') if y > @n
    (1..@n).each do |x|
      unless board.any? { |q| q.threaten?(x,y) }
        new_queen = Queen.new(x,y)
        board << new_queen
        return true if search(board, y + 1)
        board.delete(new_queen)
      end
    end
    return false
  end
end

class Queen
  attr_reader :x, :y
  def initialize(x,y)
    @x = x
    @y = y
  end

  def threaten?(other_x, other_y)
    return false if @x == 0 || @y == 0
    return true if @x == other_x
    return true if @y == other_y
    return true if ((other_y - @y).to_f / (other_x - @x).to_f).abs == 1
    false
  end
end

q = NQueens.new(8)
q.search([], 1)
q.solutions.each { |s| p s }
p q.solutions.size



class NQueens
  def initialize(n)
    @n = n
    @to_check = []
    @valid = Hash.new(nil)
  end

  def search
    (1..@n).each do |x|
      initial_node = Node.new(x,1)
      @to_check << initial_node
      @valid[[initial_node.x, initial_node.y]] = [initial_node]
    end

    until @to_check.empty? do
      node = @to_check.pop
      board = @valid[[node.x, node.y]]
      new_y = node.y + 1
      next if new_y > @n
      (1..@n).each do |x|
        threatening = board.any? { |b| b.threaten?(x, new_y) }
        unless threatening
          new_node = Node.new(x, new_y)
          @to_check << new_node
          @valid[[x, new_y]] = board + [new_node]
        end
      end
    end

    @valid
      .select { |_, board| board.size == @n }
      .each { |_, board| puts; board.each { |b| print "#{b.x},#{b.y} " } }
    puts 

    @valid
      .select { |_, board| board.size == @n }
      .size
  end
end

class Node
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def threaten?(other_x, other_y)
    return false if @x == 0 || @y == 0
    return true if @x == other_x
    return true if @y == other_y
    return true if ((other_y.to_f - y.to_f) / (other_x.to_f - x.to_f)).abs == 1
    false
  end
end

p NQueens.new(8).search
