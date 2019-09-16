input = File.read('input.txt').split("\n")
possible_triangles = input.map { |sides| sides.scan(/\w+/).map(&:to_i).sort }

p possible_triangles.size

p possible_triangles.select { |sides| sides[0] + sides[1] > sides[2] }.size
