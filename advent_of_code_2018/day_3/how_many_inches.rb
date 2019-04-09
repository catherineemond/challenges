input = File.read('./input.txt')

def parse(input)
  input.split("\n")
end

class Claim
  attr_reader :coordinates, :id

  def initialize(input)
    @id, @inches_from_left, @inches_from_top, @width, @height = parse(input)
    @coordinates = find_coordinates
  end

  def parse(input)
    input.scan(/\d+/).map(&:to_i)
  end

  def find_coordinates
    horizontal_inches = (@inches_from_left...@inches_from_left + @width).to_a
    vertical_inches = (@inches_from_top...@inches_from_top + @height).to_a
    horizontal_inches.product(vertical_inches)
  end
end

claims = parse(input).map { |line| Claim.new(line) }
taken_cloth = Hash.new(0)

claims.each do |claim|
  claim.coordinates.each { |coordinate| taken_cloth[coordinate] += 1 }
end

p taken_cloth.select { |_coordinate, count| count > 1 }.size

the_one_claim = claims.find do |claim|
  claim.coordinates.all? { |coordinate| taken_cloth[coordinate] == 1 }
end

p the_one_claim.id
