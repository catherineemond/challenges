class Game
  def initialize
    @frames        = Array.new(10) { Array.new }
    @current_frame = 0
  end

  def roll(pins)
    frame = @frames[@current_frame]

    raise(RuntimeError, "Cannot roll after game has ended") if @current_frame == 10
    raise(RuntimeError, "Number of pins must be between 0 and 10") unless (0..10).cover?(pins)
    if (frame.sum + pins > 10 && @current_frame < 9) ||
      (@current_frame == 9 && frame.last != 10 && frame.last.to_i + pins > 10)
      raise(RuntimeError, "Pin count exceeds number of lane pins")
    end

    frame.push(pins)

    if @current_frame == 9
      throws = frame.size
      if
        (throws == 2 && frame.sum < 10 )
        || throws == 3
        @current_frame += 1
      end
    else
      frame.push(0) if pins == 10
      @current_frame += 1 if frame.size == 2
    end
  end

  def score
    total = 0
    raise(RuntimeError, "Cannot score before game has ended") if @current_frame < 10

    (0..9).each do |i|
      frame = @frames[i]
      score = frame.sum

      if spare?(frame)
        score += @frames[i+1][0]
      elsif strike?(frame)
        if strike?(@frames[i+1])
          score += (@frames[i+1].sum + @frames[i+2][0])
        else
          score += @frames[i+1][0] + @frames[i+1][1]
        end
      end

      total += score
    end
    total
  end

  def spare?(frame)
    frame.sum == 10 && frame.all? { |f| (1..9).cover?(f) }
  end

  def strike?(frame)
    frame == [10, 0]
  end
end
