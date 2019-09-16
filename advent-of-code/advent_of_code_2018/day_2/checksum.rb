input = File.read('./input.txt')

def parse(input)
  input.split("\n")
end

# - loop over all the box ids
#   - if a char appears twice, increment the twice_count by one
#   - if a char appears thrice, increment the thrice_count by one
# - special rule:
#   - if there is twice a twice count, it counts only once
#   - if there is twice a thrice count, it counts only once
#   - if there is one of each, it counts once for each
# - in the end multiply the twice_count by the thrice_count

# build a hash of char count?

def checksum(input)
  twice_count = 0
  thrice_count = 0

  parse(input).each do |box_id|
    char_count = {}

    box_id.chars.each do |char|
      if char_count[char]
        char_count[char] += 1
      else
        char_count[char] = 1
      end
    end

    twice_count += 1 if char_count.any? { |char, count| count == 2 }
    thrice_count += 1 if char_count.any? { |char, count| count == 3 }
  end

  twice_count * thrice_count
end

p checksum(input)
