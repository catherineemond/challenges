class BunnyHQ
  TURNS = {
    'N' => ['W', 'E'],
    'E' => ['N', 'S'],
    'S' => ['E', 'W'],
    'W' => ['S', 'N']
  }

  def initialize(input)
    @hq = nil
    @steps = input.split(', ')
    @all_steps = [[0, 0]]
    @x = 0
    @y = 0
  end

  def find_distance
    direction = 'N'

    @steps.each do |step|
      if step[0] == 'L'
        direction = TURNS[direction][0]
      else
        direction = TURNS[direction][1]
      end

      number_of_steps = step[1..-1].to_i

      case direction
      when 'N'
        register_steps_going_north(number_of_steps)
        @x += number_of_steps
      when 'E'
        register_steps_going_east(number_of_steps)
        @y += number_of_steps
      when 'S'
        register_steps_going_south(number_of_steps)
        @x -= number_of_steps
      when 'W'
        register_steps_going_west(number_of_steps)
        @y -= number_of_steps
      end

      return @hq.map(&:abs).sum if @hq
    end

    @x.abs + @y.abs
  end

  private

  def register_steps_going_north(number_of_steps)
    next_step = @x + 1
    destination = @x + number_of_steps

    (next_step..destination).each do |x|
      current_position = [x, @y]
      @hq = current_position if @all_steps.include?(current_position)
      @all_steps << current_position
    end
  end

  def register_steps_going_east(number_of_steps)
    next_step = @y + 1
    destination = @y + number_of_steps

    (next_step..destination).each do |y|
      current_position = [@x, y]
      @hq = current_position if @all_steps.include?(current_position)
      @all_steps << current_position
    end
  end

  def register_steps_going_south(number_of_steps)
    next_step = @x - 1
    destination = @x - number_of_steps

    (destination..next_step).each do |x|
      current_position = [x, @y]
      @hq = current_position if @all_steps.include?(current_position)
      @all_steps << current_position
    end
  end

  def register_steps_going_west(number_of_steps)
    next_step = @y - 1
    destination = @y - number_of_steps

    (destination..next_step).each do |y|
      current_position = [@x, y]
      @hq = current_position if @all_steps.include?(current_position)
      @all_steps << current_position
    end
  end
end

input = File.read('input.txt').chomp
p BunnyHQ.new(input).find_distance

# Markus

class Taxicab
  FACING = {
    north: { 'L' => :west,  'R' => :east,  dir: 1, delta: 1  },
    east:  { 'L' => :north, 'R' => :south, dir: 0, delta: 1  },
    south: { 'L' => :east,  'R' => :west,  dir: 1, delta: -1 },
    west:  { 'L' => :south, 'R' => :north, dir: 0, delta: -1 }
  }

  def initialize
    @input         = File.read('input.txt').split(', ')
  end

   def run
    position    = [0, 0]
    orientation = :north

    visited = []
    visited_twice = nil

    @input.each do |walk|
      orientation = FACING[orientation][walk[0]] # new orientation
      distance    = walk[1..-1].to_i             # distance to move in new direction
      dir   = FACING[orientation][:dir]          # position index to change
      delta = FACING[orientation][:delta]        # positive/negative change

      distance.times do
        position[dir] = position[dir] += (delta * 1) # incrementally determine new positions
        visited_twice = *position if visited.any? { |l| l == position } && visited_twice.nil?
        visited.push([*position])
      end
    end

    puts position[0].abs + position[1].abs           # solution 1
    puts visited_twice[0].abs + visited_twice[1].abs # solution 2
  end
end

Taxicab.new.run
