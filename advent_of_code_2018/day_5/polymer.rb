input = File.read('./input.txt').chomp

reacting_units = ('a'..'z').each_with_object([]) { |char, arr| arr << (char + char.upcase) << (char.upcase + char) }

loop do
  input_before = input.dup
  reacting_units.each { |unit| input.gsub!(unit, '') }
  break if input == input_before
end

p input.size
