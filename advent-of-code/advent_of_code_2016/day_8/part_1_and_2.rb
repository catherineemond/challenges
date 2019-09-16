# start state:
#  - a screen 50px wide and 6px tall
#  - all pixels are off

# 3 types of command:
#  - rect AxB => turns on all the pixels in the top left of the screen
#  - rotate row A by B => shift all of the pixels in a given row (with wrapping)
#  - rotate column A by B => shift all of the pixels in a given column (with wrapping)

# input: list of commands (to be parsed)
# output: number of pixels lit on the screen

class Device
  def initialize(input)
    @commands = input.split("\n")
    @screen = Array.new(6) { Array.new(50, ' ') }
    swipe_card
  end

  def pixel_count
    screen.map { |row| row.count('#') }.sum
  end

  def display_screen
    screen.each { |row| p row.join }
  end

  private

  attr_accessor :screen

  def swipe_card
    @commands.each do |command|
      if command.match?('rect')
        rectangle(command)
      elsif command.match?('row')
        rotate_row(command)
      elsif command.match?('column')
        rotate_column(command)
      end
    end
  end

  def parse(command)
    command.scan(/\d+/).map(&:to_i)
  end

  def rectangle(command)
    width, height = parse(command)

    (0...height).each do |x|
      (0...width).each do |y|
        screen[x][y] = '#'
      end
    end
  end

  def rotate_row(command)
    row, shift = parse(command)
    screen[row].rotate!(-shift)
  end

  def rotate_column(command)
    col, shift = parse(command)

    modified_screen = screen.transpose
    modified_screen[col].rotate!(-shift)

    self.screen = modified_screen.transpose
  end
end

input = File.read('input.txt')
device = Device.new(input)
p device.pixel_count # => 115
device.display_screen # => EFEYKFRFIJ
