# Just playing around with Struct

class Queens
  Position = Struct.new(:x, :y)

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black

    @white = Position.new(*white)
    @black = Position.new(*black)

    create_board
    place_queen(@white, 'W')
    place_queen(@black, 'B')
  end

  def white
    [@white.x, @white.y]
  end

  def black
    [@black.x, @black.y]
  end

  def attack?
    same_row? || same_column? || same_diagonal?
  end

  def to_s
    @board.map { |row| row.join(' ') }.join("\n")
  end

  private

  def create_board
    @board = []
    8.times { @board << Array.new(8) { '_' } }
  end

  def place_queen(position, queen_marker)
    @board[position.x][position.y] = queen_marker
  end

  def same_row?
    @white.x == @black.x
  end

  def same_column?
    @white.y == @black.y
  end

  def same_diagonal?
    (@white.x - @black.x).abs == (@white.y - @black.y).abs
  end
end
