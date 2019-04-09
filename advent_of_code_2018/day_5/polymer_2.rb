class Polymer # :nodoc:
  attr_reader :sequence

  def initialize
    @sequence = File.read('./input.txt').chomp
    @reacting_units = ('a'..'z').each_with_object([]) do |char, arr|
      arr << (char + char.upcase) << (char.upcase + char)
    end
  end

  def react
    loop do
      input_before = @sequence.dup
      @reacting_units.each { |unit| @sequence.gsub!(unit, '') }
      break if @sequence == input_before
    end
  end

  def find_problematic_unit
    possibilities = ('a'..'z').each_with_object({}) do |letter, results|
      test_polymer = Polymer.new
      test_polymer.sequence.delete!(letter + letter.upcase)
      test_polymer.react
      results[letter] = test_polymer.sequence.size
    end

    possibilities.values.min
  end
end

polymer = Polymer.new
p polymer.find_problematic_unit
