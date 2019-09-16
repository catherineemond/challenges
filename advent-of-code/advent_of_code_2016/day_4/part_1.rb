class Room
  attr_reader :sector_id

  def initialize(str)
    @input = str.scan(/\w+/)
    @checksum = @input[-1]
    @sector_id = @input[-2].to_i
    @chars = @input[0...-2].reduce(:+).chars
    @key = parse_for_key
  end

  def valid?
    @key == @checksum
  end

  def parse_for_key
    char_count = @chars.each_with_object(Hash.new(0)) { |char, count| count[char] += 1 }
    sorted = char_count.group_by { |k, v| v }.sort_by { |k, v| k }.reverse
    sorted = sorted.map { |group| group[1].sort_by { |count| count [0] } }
    sorted.flatten.reject { |el| el.class == Integer }.first(5).join
  end
end

list = File.read('input.txt').split("\n").map { |str| Room.new(str) }
valid_rooms = list.select { |room| room.valid? }
answer = valid_rooms.map { |room| room.sector_id }.sum

p answer
