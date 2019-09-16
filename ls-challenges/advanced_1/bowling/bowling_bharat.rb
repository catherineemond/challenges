class Game
  def initialize
    @frame_number = 1
    @frames = (1..10).map { |frame_number| Frame.new(frame_number) }
  end

  def roll(pins_downed)
    raise 'Should not be able to roll after game is over' if all_frames_full?
	# using @frame_number - 1 because @frame_number starts with 1 index
    @frame_number += 1 if @frames[@frame_number - 1].full?

    @frames[@frame_number - 1].add_pins_down(pins_downed)
  end

  def score
    raise_errors_for_invalid_score_check

    frame_scores = @frames.map do |frame|
      if frame.open? || frame.final_frame?
        frame.sum
      elsif frame.spare?
        10 + find_next_frame(frame).first_pin
      elsif frame.strike?
        handle_strike_scoring(frame)
      end
    end

    frame_scores.sum
  end

  def handle_strike_scoring(frame)
    sum_of_current_frame = frame.sum
    next_frame = find_next_frame(frame)
    consecutive_strikes = next_frame.strike?

    if frame.penultimate_frame? && consecutive_strikes
      sum_of_current_frame + next_frame.first_pin +
        next_frame.second_pin
    elsif consecutive_strikes
      sum_of_current_frame + next_frame.first_pin +
        find_next_frame(next_frame).first_pin
    else
      sum_of_current_frame + next_frame.sum
    end
  end

  def find_next_frame(current_frame)
    @frames[current_frame.next_frame_number]
  end

  def raise_errors_for_invalid_score_check
    raise 'Game is not yet over, cannot score!' if
    (@frames.last.strike? || @frames.last.spare?) &&
    @frames.last.pins_downed.size < 3

    raise 'Score cannot be taken until the end of the game' unless
    all_frames_full?
  end

  def all_frames_full?
    @frames.all?(&:full?)
  end
end

class Frame
  attr_reader :pins_downed, :frame_number

  def initialize(frame_number)
    @frame_number = frame_number
    @pins_downed = []
  end

  def add_pins_down(pins_down)
    raise 'Pins must have a value from 0 to 10' unless
    (0..10).cover?(pins_down)

    if final_frame?
      @pins_downed << pins_down
    else
      @pins_downed << pins_down
      @pins_downed << 0 if pins_down == 10
    end

    raise 'Pin count exceeds pins on the lane' unless sum_valid?
  end

  def sum_valid?
    if double_strike_in_final_throw?
      (0..30).cover?(@pins_downed.sum)
    elsif using_fill_balls?
      (0..20).cover?(@pins_downed.sum)
    else
      (0..10).cover?(@pins_downed.sum)
    end
  end

  def full?
    using_fill_balls? ? @pins_downed.size == 3 : @pins_downed.size == 2
  end

  def using_fill_balls?
    final_frame? && (strike? || spare?)
  end

  def double_strike_in_final_throw?
    final_frame? && strike? && pins_downed[1] == 10
  end

  def final_frame?
    @frame_number == 10
  end

  def normal_frame?
    !final_frame?
  end

  def penultimate_frame?
    @frame_number == 9
  end

  def strike?
    @pins_downed.first == 10
  end

  def spare?
    @pins_downed[0..1].sum == 10 && @pins_downed.first != 10
  end

  def open?
    @pins_downed[0..1].sum < 10
  end

  def first_pin
    @pins_downed.first
  end

  def second_pin
    @pins_downed[1]
  end

  def sum
    @pins_downed.sum
  end

  def next_frame_number
    # not incrementing by one because using 1 index
    @frame_number
  end
end
