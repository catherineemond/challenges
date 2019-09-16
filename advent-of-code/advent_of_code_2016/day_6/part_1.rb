rows = File.read('input.txt').split("\n")

p rows.map(&:chars).transpose.map { |arr| arr.max_by { |el| arr.count(el) } }.join
p rows.map(&:chars).transpose.map { |arr| arr.min_by { |el| arr.count(el) } }.join
