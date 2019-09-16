require 'pry'
=begin
input:  - a string, with letters, spaces(one or more), and a final point

output: - a string, modified from the original
        - words should be separated by a single space
        - the last word is followed by a final point
        - words at odd index (ex. 1) are reversed
        - words at even index (ex. 0) are returned as is

bonus:  - the characters must be read and printed one at a time.

notes:
  - any other kind of punctuation that must be taken in account?
    => doesn't seem to be the case, according to problem description
  - upcase/lowercase ?
    => same as above
  - what to do with empty string / invalid input?
  - not sure about the meaning of the bonus?
    => as I understand it, just iterate over the final string, outputting chars one at the time??

algorithm:
  - use scan + regex to create an array of words; the last point will be eliminated
  - iterate over the array, prob. each_with_index
  - reverse the words at odd index
  - join(' ') and << '.' (final point)
=end

# def odd_words(sentence)
#   return '' if sentence.empty?
#   words = sentence.scan(/\b[\w'?]+\b/)
#
#   new_sentence = words.map.with_index do |word, index|
#     index.odd? ? word.reverse : word
#   end.join(' ') << '.'
# end

def odd_words(sentence)
  return '' if sentence.empty?

  chars = sentence.chars
  new_str = ''
  current_word = ''
  reverse = false

  loop do
    current_char = chars.shift
    next if current_char == ' ' && (chars[0] == ' ' || chars[0] == '.')

    if current_char == ' '
      new_str << (reverse ? current_word.reverse : current_word) << ' '
      current_word = ''
      reverse ? reverse = false : reverse = true
      next
    end

    current_word << current_char

    if current_char == '.' || chars.empty?
      new_str << current_word
      return new_str
    end
  end
end

p odd_words("whats the matter with kansas.") == "whats eht matter htiw kansas."
p odd_words('hello') == 'hello'
p odd_words('hello.') == 'hello.'
p odd_words('') == ''
p odd_words("whats    the matter   with kansas  .") == "whats eht matter htiw kansas."
# p odd_words("what's the matter?") == "what's eht matter."
