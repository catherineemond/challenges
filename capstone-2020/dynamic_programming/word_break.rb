# Here I implemented the idea I had yesterday
# passes 28/36 of LeetCode test cases and times out after that

# what are the overlapping subproblems?
# how do we know where to break down the input string?
# can the input array contain extra words -> yes

# "apple", ['apple', 'applepie'] => true

# "catsandog", ['cats', 'dog', 'sand', 'and', 'cat'] => false

# "catsand", ['cats', 'sand', 'cat'] => true

# what would be a naive approach?
# - iterate on dict.
#  - for each word: see if it is contained in input str
#    - if yes - delete + start again from the smaller substr and next dict. entry
#    - if no - move to the next dict entry
#  - stop when:
#    - we're left with an empty str
#    - no word in the dictionary matches


def word_break(s, word_dict)
  return true if s.strip.empty?
  
  word_dict.each do |word|
    next if word.length > s.length
    next unless s.match?(word)
    new_str = s.gsub(word, ' ')
    return true if word_break(new_str, word_dict)
  end
  
  false
end