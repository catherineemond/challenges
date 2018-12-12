require 'pry'
=begin
The eight queens puzzle is based on the classic strategy game problem:
in this case putting 8 queens on an 8*8 chessboard
such that none of them is able to capture any other using the standard chess queen's moves.
The color of the queens is meaningless and any queen is assumed to be able to attack any other.

Thus, the solution requires that no two queens share the same row, column, or diagonal

Find the total number of all possible board positions for this puzzle.
=end

# This one is a terrible first try :)
# next try to solve it using array of coordinates? + recursion?

def multiple_combinations
  (1..64).each_with_object([]) do |num, combinations|
    next unless combination = possible_combination(num)
    combinations << combination.sort
  end.uniq.size
end

def possible_combination(num)
  combination = []
  possibilities = (1..64).to_a
  backtracked_possibilities = nil
  position = num

  loop do
    break if combination.size == 8

    if remaining_positions(position, possibilities).empty?
      possibilities = backtracked_possibilities
      possibilities[1] == combination.last ? break : position = possibilities[1]
    end

    combination << position
    backtracked_possibilities = possibilities
    possibilities = remaining_positions(position, possibilities)
    position = possibilities[0]
  end

  combination.size == 8 ? combination : nil
end

def remaining_positions(chosen_position, possibilities)
  possibilities.reject do |num|
    find_row(chosen_position).include?(num) ||
    find_column(chosen_position).include?(num) ||
    find_diagonal_1(chosen_position).include?(num) ||
    find_diagonal_2(chosen_position).include?(num)
  end
end

def find_row(position)
  end_of_row = find_end_of_row(position)
  beginning_of_row = end_of_row - 7
  (beginning_of_row..end_of_row).to_a
end

def find_end_of_row(position)
  (position..64).each { |num| return num if num % 8 == 0 }
end

def find_column(position)
  (1..64).select { |num| num % 8 == position % 8 }
end

def first_column
  (1..57).step(8).to_a
end

def last_column
  (8..64).step(8).to_a
end

def find_diagonal_1(position)
  ((position % 9)..64).step(9).each_with_object([]) do |num, obj|
    obj << num
    break obj if last_column.include?(num)
  end
end

def find_diagonal_2(position)
  ((position % 7)..64).step(7).each_with_object([]) do |num, obj|
    obj << num
    break obj if first_column.include?(num)
  end
end

p multiple_combinations #  I get to 20, should be a total of 92 solutions.

# [1, 2 , 3 , 4 , 5 , 6 , 7 , 8 ]
# [9 , 10, 11, 12, 13, 14, 15, 16]
# [17, 18, 19, 20, 21, 22, 23, 24]
# [25, 26, 27, 28, 29, 30, 31, 32]
# [33, 34, 35, 36, 37, 38, 39, 40]
# [41, 42, 43, 44, 45, 46, 47, 48]
# [49, 50, 51, 52, 53, 54, 55, 56]
# [57, 58, 59, 60, 61, 62, 63, 64]
