# The eight queens puzzle is based on the classic strategy game problem:
# in this case putting 8 queens on an 8*8 chessboard
# such that none of them is able to capture any other using the standard chess queen's moves.
# The color of the queens is meaningless and any queen is assumed to be able to attack any other.
#
# Thus, the solution requires that no two queens share the same row, column, or diagonal
#
# Find the total number of all possible board positions for this puzzle.

class Square
  attr_reader :x, :y
  attr_accessor :status

  def initialize(x, y)
    @x = x
    @y = y
    @status = :empty
  end

  def attacked_by?(queen_position)
    same_column?(queen_position) || same_row?(queen_position) || same_diagonal?(queen_position)
  end

  def same_column?(queen_position)
    self.x == queen_position.x
  end

  def same_row?(queen_position)
    self.y == queen_position.y
  end

  def same_diagonal?(queen_position)
    (self.x - queen_position.x).abs == (self.y - queen_position.y).abs
  end
end

class Board
  attr_reader :squares

  def initialize
    @squares = create_board
  end

  def create_board
    [*0..7].product([*0..7]).map { |position| Square.new(*position) }
  end

  def place_queen(queen_position)
    queen_position.status = :queen
    #mark_attacked_squares(queen_position)
  end

  def remove_queen(queen_position)
    queen_position.status = :empty
    #mark_attacked_squares(queen_position)
  end

  def select_column(num)
    squares.select { |square| square.x == num }
  end

  # def mark_attacked_squares(queen_position)
  #   @squares.each do |square|
  #     next unless square.status == :empty
  #     square.status = :attacked if square.attacked_by?(queen_position)
  #   end
  # end

  def next_empty_square
    @squares.find { |square| square.status == :empty }
  end

  def to_s
    board = (0..7).each_with_object([]) do |row_number, board|
      row = @squares.select { |square| square.x == row_number }
      board << row.map do |square|
        case square.status
        when :empty     then '_'
        when :queen     then 'Q'
        when :attacked  then 'X'
        end
      end
    end
    board.map { |row| row.join(' ') }.join("\n")
  end
end

class ProblemSolver
  attr_reader :board

  def initialize
    @board = Board.new
    @solutions = []
  end

  # I think I need to change my model
  # and progress column by column, or row by row
  # i.e. not treating my board as an array of squares

  def place_queens(column=0, row=0, queen_count=8)
    square = board.select_column(column)[row]
    board.place_queen(square)

    next_column = board.select_column(column + 1)
    if
    if board.next_empty_square
      place_queens
    else
      board.remove_queen(square)
      square.status = :tried
      return
    end
  end
end

solution = ProblemSolver.new
solution.place_queens
