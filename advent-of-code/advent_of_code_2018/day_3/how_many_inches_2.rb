input = File.read('./input.txt')

class Claim
  attr_reader :coordinates, :id

  def initialize(input)
    @id, @inches_from_left, @inches_from_top, @width, @height = parse(input)
    @coordinates = find_coordinates
  end

  private

  def parse(input)
    input.scan(/\d+/).map(&:to_i)
  end

  def find_coordinates
    horizontal_inches = (@inches_from_left...@inches_from_left + @width).to_a
    vertical_inches = (@inches_from_top...@inches_from_top + @height).to_a
    horizontal_inches.product(vertical_inches)
  end
end

class ClaimAnalyzer
  def initialize(input)
    @claims = generate_data(input)
    @cloth = Hash.new(0)
    map_claims_to_cloth
  end

  def find_overlap_size
    @cloth.select { |_coordinates, count| count > 1 }.size
  end

  def find_claim_without_overlap
    @claims.find do |claim|
      claim.coordinates.all? { |coordinate| @cloth[coordinate] == 1 }
    end
  end

  private

  def generate_data(input)
    input.split("\n").map { |line| Claim.new(line) }
  end

  def map_claims_to_cloth
    @claims.each do |claim|
      claim.coordinates.each { |coordinate| @cloth[coordinate] += 1 }
    end
  end
end

problem_solver = ClaimAnalyzer.new(input)
p problem_solver.find_overlap_size
p problem_solver.find_claim_without_overlap.id
