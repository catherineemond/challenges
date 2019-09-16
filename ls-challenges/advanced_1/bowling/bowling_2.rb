class Game
  def initialize
    @rolls = []
    @frames = []
    @score = 0
  end

  def roll(pins)
    validate_roll(pins)

    @rolls << pins
    @rolls << 0 if pins == 10

    @frames << Frame.new(@rolls.last(2)) if @rolls.size.even? && @rolls.size <= 20
  end

  def score
    validate_score
    add_fill_balls if @rolls.size > 20

    @frames.each_with_index do |frame, index|
      @score += frame.total

      compute_fill_balls(frame) && break if index == 9 && !frame.open?

      compute_bonus(frame) unless frame.open?
    end
    @score
  end

  private

  def validate_roll(pins)
    raise 'Pins must have a value from 0 to 10' unless (0..10).to_a.include?(pins)
    raise 'Pin count exceeds pins on the lane' if @rolls.index(@rolls.last)&.even? && @rolls.last + pins > 10
    raise 'Should not be able to roll after game is over' if @frames.size == 10 && @frames.last.open?
  end

  def validate_score
    raise 'Score cannot be taken until the end of the game' if @frames.size < 10
    raise 'Game is not yet over, cannot score!' if !@frames.last.open? && @rolls.size <= 20
  end

  def compute_bonus(frame)
    if frame.spare?
      spare_bonus(frame)
    elsif frame.strike?
      strike_bonus(frame)
    end
  end

  def find_next(current_frame)
    @frames[@frames.index(current_frame) + 1]
  end

  def spare_bonus(frame)
    next_frame = find_next(frame)
    @score += next_frame.first_throw
  end

  def strike_bonus(frame)
    next_frame = find_next(frame)
    bonus = next_frame.total
    bonus += find_next(next_frame).first_throw if next_frame.strike?
    @score += bonus
  end

  def add_fill_balls
    index = 20

    loop do
      current_throw = @rolls[index]

      if current_throw == 10
        @frames << Frame.new([current_throw, @rolls[index + 1]])
        index += 2
      else
        @frames << Frame.new([current_throw, 0])
        index += 1
      end

      break if index >= @rolls.size
    end
  end

  def compute_fill_balls(last_frame)
    fill_balls = @frames[10..-1]

    if last_frame.spare?
      @score += fill_balls.first.total
    elsif last_frame.strike?
      @score += fill_balls.map(&:total).sum
    end
  end
end

class Frame
  attr_reader :total, :first_throw

  def initialize(throws)
    @first_throw = throws.first
    @second_throw = throws.last
    @total = @first_throw + @second_throw
  end

  def strike?
    @first_throw == 10
  end

  def spare?
    !strike? && @total == 10
  end

  def open?
    @total < 10
  end
end
