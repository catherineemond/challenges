# MOVES = {
#   1 => { 'U' => 1, 'D' => 3, 'L' => 1, 'R' => 1 },
#   2 => { 'U' => 2, 'D' => 6, 'L' => 2, 'R' => 3 },
#   3 => { 'U' => 1, 'D' => 7, 'L' => 2, 'R' => 4 },
#   4 => { 'U' => 4, 'D' => 8, 'L' => 3, 'R' => 4 },
#   5 => { 'U' => 5, 'D' => 5, 'L' => 5, 'R' => 6 },
#   6 => { 'U' => 2, 'D' => 'A', 'L' => 5, 'R' => 7 },
#   7 => { 'U' => 3, 'D' => 'B', 'L' => 6, 'R' => 8 },
#   8 => { 'U' => 4, 'D' => 'C', 'L' => 7, 'R' => 9 },
#   9 => { 'U' => 9, 'D' => 9, 'L' => 8, 'R' => 9 },
#   'A' => { 'U' => 6, 'D' => 'A', 'L' => 'A', 'R' => 'B' },
#   'B' => { 'U' => 7, 'D' => 'D', 'L' => 'A', 'R' => 'C' },
#   'C' => { 'U' => 8, 'D' => 'C', 'L' => 'B', 'R' => 'C' },
#   'D' => { 'U' => 'B', 'D' => 'D', 'L' => 'D', 'R' => 'D' }
# }
#
# input = File.read('input.txt').split("\n")
# key = 5
#
# code = input.map do |line|
#   line.chars.each { |direction| key = MOVES[key][direction] }
#   key
# end
#
# p code

#------------------------------------------------------------------------------
KEYBOARD = [
  [nil, nil, 1, nil, nil],
  [nil, 2, 3, 4, nil],
  [5, 6, 7, 8, 9],
  [nil, 'A', 'B', 'C', nil],
  [nil, nil, 'D', nil, nil]
]

MOVES = {
  'U' => [-1, 0],
  'D' => [1, 0],
  'L' => [0, -1],
  'R' => [0, 1]
}

input = File.read('input.txt').split("\n")
x = 2
y = 0

code = input.map do |line|
  line.chars.each do |direction|
    new_x = x + MOVES[direction][0]
    new_y = y + MOVES[direction][1]

    x = new_x unless new_x < 0 || new_x > 4 || KEYBOARD[new_x][y].nil?
    y = new_y unless new_y < 0 || new_y > 4 || KEYBOARD[x][new_y].nil?
  end
  KEYBOARD[x][y]
end

p code
