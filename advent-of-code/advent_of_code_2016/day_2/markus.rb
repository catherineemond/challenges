# Markus

class Bathroom
  def initialize
    @input = File.read('input.txt').split("\n")

    @keypad_first = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    @keypad_second = [
      [nil, nil,  1,  nil, nil],
      [nil,  2,   3,   4,  nil],
      [ 5,   6,   7,   8,   9 ],
      [nil, 'A', 'B', 'C', nil],
      [nil, nil, 'D', nil, nil]
    ]

    @directions = {
      'U' => [-1, 0],
      'D' => [ 1, 0],
      'L' => [ 0,-1],
      'R' => [ 0, 1]
    }
  end

  def run(solution)
    combination = ''

    if solution == :first
      current_key = [1, 1]
      keypad      = @keypad_first
    elsif solution == :second
      current_key = [2, 0]
      keypad      = @keypad_second
    end

    @input.each do |line|
      code_coord = line.chars.reduce([]) do |key, dir|

        new_coord = current_key
          .zip(@directions[dir]) # merge coordinates with change value,
          .map(&:sum)

        # [2, 0] [-1, 0] -> [[2, -1], [0, 0]]

        new_key = keypad
          .fetch(new_coord[0], [])  # fetch row, return empty array if out of bounds
          .fetch(new_coord[1], nil) # fetch column, return nil if out of bounds

        unless new_coord.any? { |c| c < 0 || c > keypad.length - 1 } || new_key.nil?
          current_key = new_coord
        end

        current_key
      end
      combination += keypad[code_coord.first][code_coord.last].to_s
    end
    combination
  end
end

puts Bathroom.new.run(:first)  # solution 1
puts Bathroom.new.run(:second) # solution 2
