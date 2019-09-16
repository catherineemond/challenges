# MOVES = {
#   1 => { 'U' => 1, 'D' => 4, 'L' => 1, 'R' => 2 },
#   2 => { 'U' => 2, 'D' => 5, 'L' => 1, 'R' => 3 },
#   3 => { 'U' => 3, 'D' => 6, 'L' => 2, 'R' => 3 },
#   4 => { 'U' => 1, 'D' => 7, 'L' => 4, 'R' => 5 },
#   5 => { 'U' => 2, 'D' => 8, 'L' => 4, 'R' => 6 },
#   6 => { 'U' => 3, 'D' => 9, 'L' => 5, 'R' => 6 },
#   7 => { 'U' => 4, 'D' => 7, 'L' => 7, 'R' => 8 },
#   8 => { 'U' => 5, 'D' => 8, 'L' => 7, 'R' => 9 },
#   9 => { 'U' => 6, 'D' => 9, 'L' => 8, 'R' => 9 }
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

#-------------------------------------------------------------------------

KEYBOARD = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

MOVES = {
  'U' => [-1, 0],
  'D' => [1, 0],
  'L' => [0, -1],
  'R' => [0, 1]
}

input = File.read('input.txt').split("\n")
x = 1
y = 1

code = input.map do |line|
  line.chars.each do |direction|
    new_x = x + MOVES[direction][0]
    new_y = y + MOVES[direction][1]

    x = new_x if new_x <= 2 && new_x >= 0
    y = new_y if new_y <= 2 && new_y >= 0
  end
  KEYBOARD[x][y]
end

p code
