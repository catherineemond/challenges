# if I'm facing N:
#   L(left) =  W (negative on y axis)
#   R(right) = E (positive on y axis)
#
# if I'm facing E:
#   L = N (positive on x axis)
#   R = S (negative on x axis)
#
# if I'm facing S:
#   L = E (positive on y axis)
#   R = W (negative on y axis)
#
# if I'm facing W:
#   L = S (negative on x axis)
#   R = N (positive on x axis)

TURNS = {
  'N' => ['W', 'E'],
  'E' => ['N', 'S'],
  'S' => ['E', 'W'],
  'W' => ['S', 'N']
}

def find_distance(input)
  coordinates = [0, 0]
  direction = 'N'

  input.split(', ').each do |step|
    if step[0] == 'L'
      direction = TURNS[direction][0]
    else
      direction = TURNS[direction][1]
    end

    case direction
    when 'N' then coordinates[0] += step[1..-1].to_i
    when 'E' then coordinates[1] += step[1..-1].to_i
    when 'S' then coordinates[0] -= step[1..-1].to_i
    when 'W' then coordinates[1] -= step[1..-1].to_i
    end
  end

  coordinates.map(&:abs).sum
end

input = File.read('input.txt').chomp
p find_distance(input)
