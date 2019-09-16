# In Pascal's Triangle each number is computed by adding the numbers to the right and left of the current position in the previous row.

class Triangle
  attr_accessor :rows

  def initialize(number_of_rows)
    @rows = []
    create_triangle(number_of_rows)
  end

  private

  def create_triangle(number_of_rows)
    (1..number_of_rows).each do |number_of_elements|
      @rows << create_row(number_of_elements)
    end
  end

  def create_row(number_of_elements)
    row = []

    number_of_elements.times do |index|
      if index.zero?
        row << 1
      else
        el = @rows.last[index - 1] + (@rows.last[index] || 0)
        row << el
      end
    end

    row
  end
end
