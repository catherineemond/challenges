class Game
  def initialize
    @rolls = []
    @frames = []
    @score = 0
  end

  def roll(pins)
    raise RuntimeError, 'Pins must have a value from 0 to 10' unless (0..10).to_a.include?(pins)

    raise RuntimeError, 'Pin count exceeds pins on the lane' if @rolls.index(@rolls.last)&.even? && (@rolls.last + pins) > 10

    @rolls << pins
    @rolls << 0 if pins == 10
  end

  def score
    raise RuntimeError, 'Score cannot be taken until the end of the game' if @rolls.size < 20

    build_frames
    find_fill_balls if @rolls.size > 20

    @frames.each_with_index do |frame, index|
      @score += frame.total

      if index == 9
        compute_fill_balls(frame) if frame.spare? || frame.strike?
        break
      end

      if frame.spare?
        @score += spare_bonus(frame)
      elsif frame.strike?
        @score += strike_bonus(frame)
      end
    end

    @score
  end

  def find_next(current_frame)
    @frames[@frames.index(current_frame) + 1]
  end

  def spare_bonus(frame)
    next_frame = find_next(frame)
    next_frame.first_throw
  end

  def strike_bonus(frame)
    next_frame = find_next(frame)
    bonus = next_frame.total
    bonus += find_next(next_frame).first_throw if next_frame.strike?
    bonus
  end

  def build_frames
    @frames = []
    @rolls[0...20].each_slice(2) do |first_throw, second_throw|
      @frames << Frame.new(first_throw, second_throw)
    end
  end

  def find_fill_balls
    index = 20
    loop do
      current_throw = @rolls[index]

      if current_throw == 10
        @frames << Frame.new(current_throw, @rolls[index + 1])
        index += 2
      else
        @frames << Frame.new(current_throw, 0)
        index += 1
      end

      break if index >= @rolls.size
    end

    @fill_balls = @frames[10..-1]
  end

  def compute_fill_balls(last_frame)
    if last_frame.spare?
      @score += @fill_balls.first.total
    elsif last_frame.strike?
      @score += @fill_balls.map { |fill_ball| fill_ball.total }.sum
    end
  end
end

class Frame
  attr_reader :total, :first_throw

  def initialize(first_throw, second_throw)
    @first_throw = first_throw
    @second_throw = second_throw
    @total = @first_throw + @second_throw
    @type = determine_type
  end

  def determine_type
    if @first_throw == 10
      @type = :strike
    elsif @total == 10
      @type = :spare
    else
      @type = :open
    end
  end

  def strike?
    @type == :strike
  end

  def spare?
    @type == :spare
  end
end
