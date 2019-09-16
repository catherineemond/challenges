class Queens
  attr_reader :white, :black

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black

    @white = white
    @black = black

    create_board
    place_queen(white, 'W')
    place_queen(black, 'B')
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
    row = position[0]
    column = position[1]
    @board[row][column] = queen_marker
  end

  def same_row?
    white[0] == black[0]
  end

  def same_column?
    white[1] == black[1]
  end

  def same_diagonal?
    (white[0] - black[0]).abs == (white[1] - black[1]).abs
  end
end
