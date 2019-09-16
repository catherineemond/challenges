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
    sorted = char_count.group_by { |k, v| v }.sort_by { |k, v| k }.reverse
    sorted = sorted.map { |group| group[1].sort_by { |count| count [0] } }
    sorted.flatten.reject { |el| el.class == Integer }.first(5).join
  end

  def decrypt_input
    alphabet = ('a'..'z').to_a
    rotation = sector_id % 26

    @encrypted_text.map do |word|
      word.chars.map do |char|
        new_index = (alphabet.index(char) + rotation) % 26
        alphabet[new_index]
      end.join
    end.join(' ')
  end
end

list = File.read('input.txt').split("\n").map { |str| Room.new(str) }
valid_rooms = list.select { |room| room.valid? }

p valid_rooms.map { |room| room.sector_id }.sum
p valid_rooms.find { |room| room.name.match?('northpole') }.sector_id
