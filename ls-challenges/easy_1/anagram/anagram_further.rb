class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    words.select { |word| anagram?(@word, word) }
  end

  private

  def anagram?(word1, word2)
    return false if word1.downcase == word2.downcase

    word1.downcase.chars.each do |char|
      return false if word1.downcase.count(char) != word2.downcase.count(char)
    end

    word2.downcase.chars.each do |char|
      return false if word1.downcase.count(char) != word2.downcase.count(char)
    end
    
    true
  end
end
