# Refactored with some great ideas I found while reading your solutions!
# That tricky sorting is handled really elegantly on line 26 (inspired by Markus).
# And this is a good use case for the Array #rotate method (inspired by you both).

class Room
  attr_reader :name, :sector_id

  def initialize(str)
    @input = str.scan(/\w+/)
    @checksum = @input[-1]
    @sector_id = @input[-2].to_i
    @encrypted_text = @input[0...-2]
    @key = parse_for_key
    @name = decrypt_input
  end

  def valid?
    @key == @checksum
  end

  private

  def parse_for_key
    chars = @encrypted_text.reduce(:+).chars
    char_count = chars.each_with_object(Hash.new(0)) { |char, count| count[char] += 1 }
    sorted = char_count.to_a.sort { |a, b| [b[1], a[0]] <=> [a[1], b[0]] }
    sorted.first(5).map { |k, v| k }.join('')
  end

  def decrypt_input
    alphabet = ('a'..'z').to_a
    rotation = sector_id % 26

    @encrypted_text.map do |word|
      word.chars.map do |char|
        alphabet.rotate(rotation)[alphabet.index(char)]
      end.join
    end.join(' ')
  end
end

list = File.read('input.txt').split("\n").map { |str| Room.new(str) }
valid_rooms = list.select { |room| room.valid? }

p valid_rooms.map { |room| room.sector_id }.sum
p valid_rooms.find { |room| room.name.match?('northpole') }.sector_id
