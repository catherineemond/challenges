=begin
a palindrome is a word that is spelled the same forward and backward.
Ex: 'rotor', 'redder'

write a method to determine if a given string is a palindrome

- ignore non letters => 'no1,3on' is considered a palindrome
- case insensitive
- can't use 'reverse'
- can't use regex
- bonus: iterate only once
    => no delete;
    => need to use two counters to keep track of beginning and end
    => ignore non letters chars
=end

def palindrome?(word)
  clean_word = word.downcase.delete('^a-z')
  middle = clean_word.size / 2

  (0..middle).each do |idx|
    return false unless clean_word[idx] == clean_word[-(idx + 1)]
  end
  true
end

p palindrome?('rotor') == true
p palindrome?('RedDer') == true
p palindrome?('no1,3on') == true
p palindrome?('motor') == false
p palindrome?('aiboh  pho bia') == true
p palindrome?('ra%?&ce123car') == true
p palindrome?('a') == true
p palindrome?('') == true
