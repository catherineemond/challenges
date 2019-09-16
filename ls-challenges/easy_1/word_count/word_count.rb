=begin
Write a program that given a phrase can count the occurrences of each word in that phrase.

For example, if we count the words for the input "olly olly in come free", we should get:

olly: 2
in: 1
come: 1
free: 1

input: a string of chars, alphabetical, numerical and other
output: a hash, each word and its count
notes:
  - what count as a word?
  - what chars are taken into account?
  - case insensitive?
  - the only special case seems to be apostrophe inside word (i.e. don't)
=end

# Did this one live with Bharat
# Working solution, but iterating many times over the phrase!
# + I need a special method only to delete single quotes.

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = normalize(@phrase).split(/\s+/)
    clean_words = words.map { |word| delete_single_quotes(word) }
    clean_words.each_with_object(Hash.new(0)) do |word, word_count|
      word_count[word] += 1
    end
  end

  def normalize(str)
    str.downcase.gsub(/[^a-z0-9']/, ' ')
  end

  def delete_single_quotes(str)
    str.gsub(/^'|'$/, '')
  end

  # first try:

  # def delete_single_quotes(word)
  #   chars = word.chars
  #   chars.shift if chars.first == "'"
  #   chars.pop if chars.last == "'"
  #   chars.join
  # end
end
