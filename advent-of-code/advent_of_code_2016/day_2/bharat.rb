# Bharat
class Password
  def initialize(instruction_steps)
    @steps = instruction_steps
    @current_key = Key.new(row: 2, column: 0)
    @keys = []
    @steps.each do |row_steps|
      traverse(row_steps)
      @keys << @current_key.value
    end
  end

  def traverse(row_steps)
    row_steps.chars.each do |move|
      case move
      when 'L' then @current_key.move_left
      when 'R' then @current_key.move_right
      when 'U' then @current_key.move_up
      when 'D' then @current_key.move_down
      end
    end
  end

  def value
    @keys.join
  end
end

class Key
  KEYPAD = [
            [nil, nil, '1', nil, nil],
            [nil, '2', '3', '4', nil],
            ['5', '6', '7', '8', '9'],
            [nil, 'A', 'B', 'C', nil],
            [nil, nil, 'D', nil, nil]
          ]

  def initialize(coordinates)
    @row = coordinates[:row]
    @column = coordinates[:column]
  end

  def value
    KEYPAD[@row][@column]
  end

  def move_up
    return if @row == 0
    @row -= 1 if KEYPAD[@row - 1][@column]
  end

  def move_down
    return if @row == 4
    @row += 1 if KEYPAD[@row + 1][@column]
  end

  def move_right
    return if @column == 4
    @column += 1 if KEYPAD[@row][@column + 1]
  end

  def move_left
    return if @column == 0
    @column -= 1 if KEYPAD[@row][@column - 1]
  end
end

instruction_steps = File.readlines('day2_input.txt', chomp: true)
p Password.new(instruction_steps).value # => "46C91"
