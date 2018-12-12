class Scrabble
  SCORES = {
    %w(a e i o u l n r s t) => 1,
    %w(d g) => 2,
    %w(b c m p) => 3,
    %w(f h v w y) => 4,
    %w(k) => 5,
    %w(j x) => 8,
    %w(q z) => 10
    }

  def initialize(input)
    @word = validate(input)
  end

  def self.score(input)
    Scrabble.new(input).score
  end

  def score
    @word.chars.map do |char|
      SCORES.keys.each { |key| break SCORES[key] if key.include?(char) }
    end.sum
  end

  private

  def validate(input)
    return '' if input.nil?
    return '' unless input.match?(/[a-zA-Z]/)
    input.downcase
  end
end
