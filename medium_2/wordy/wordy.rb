class WordProblem
  def initialize(str)
    @word_problem = str.delete('?by').split[2..-1]
    @result = @word_problem.shift.to_i
  end

  def answer
    raise ArgumentError unless valid?(@word_problem)
    @word_problem.each_slice(2) { |token, number| send(token, number.to_i) }
    @result
  end

  private

  def plus(number)
    @result += number
  end

  def minus(number)
    @result -= number
  end

  def multiplied(number)
    @result *= number
  end

  def divided(number)
    @result /= number
  end

  def valid?(word_problem)
    possible_operations = %w(plus minus multiplied divided)
    word_problem.all? do |token|
      token.match(/\A-?\d+\z/) || possible_operations.include?(token)
    end
  end
end
