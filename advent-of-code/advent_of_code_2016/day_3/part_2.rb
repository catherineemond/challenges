input = File.read('input.txt').split("\n")
possible_triangles = input.map { |sides| sides.scan(/\w+/).map(&:to_i) }

count = 0

possible_triangles.transpose.flatten.each_slice(3) do |sides|
  sides = sides.sort
  count += 1 if sides[0] + sides[1] > sides[2]
end

p count
