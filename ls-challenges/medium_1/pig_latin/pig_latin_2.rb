class PigLatin
  def self.translate(string)
    string.split.map { |word| convert(word) }.join(' ')
  end

  private

  def self.convert(word)
    if begins_with_vowel_sound?(word)
      word << 'ay'
    else
      word.sub(/\b(s?qu|[^aeiou]+)(\w+)\b/, '\2\1ay')
    end
  end

  def self.begins_with_vowel_sound?(word)
    word.match?(/\A[aeiou]|[xy][^aeiou]/)
  end
end
