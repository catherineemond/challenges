class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    words.select { |word| anagram?(@word, word) }
  end

  private

  def anagram?(word1, word2)
    word1.downcase.chars.sort == word2.downcase.chars.sort &&
    word1.downcase != word2.downcase
  end
end
