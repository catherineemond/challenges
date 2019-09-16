=begin
input : string, one or many downcased words
output: string

rules:
  - if word begins with vowels, add 'ay' to the end
    => apple : appleay

  - if word begins with a consonant, move the first consonant
    to the end and add 'ay'
    => pig : igpay

  edge cases : ch, qu, squ, th, thr, sch, y(consonant/vowel),
              x(consonant/vowel)
=end

class PigLatin
  def self.translate(str)
    str.split.map { |word| convert(word) }.join(' ')
  end

  private

  def self.convert(word)
    letters = word.chars

    if word[0..2].match?(/(squ|sch|thr)/)
      (letters[3..-1] + letters[0..2] << 'ay').join
    elsif word[0..1].match?(/(ch|th|qu)/)
      (letters[2..-1] + letters[0..1] << 'ay').join
    elsif word[0..1].match?(/(y[aeiou]|xe)/)
      (letters[1..-1] << letters[0] << 'ay').join
    elsif word[0].match?(/[aeiouyx]/)
      word << 'ay'
    else
      (letters[1..-1] << letters[0] << 'ay').join
    end
  end
end
