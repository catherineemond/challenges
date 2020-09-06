# optimized after looking at a few possible solutions
# passes all test cases on LeetCode

def word_break(s, word_dict)
  dict = Set.new(word_dict) # faster lookup
  memo = Array.new(s.length + 1, false) # dp table for each substring LENGTH
  memo[0] = true # an empty string returns true
  
  start_idx = 0
  
  while start_idx < s.length do
    length = 1
    
    while length <= s.length - start_idx do
      substring = s.slice(start_idx, length)
      
      if memo[start_idx] && dict.include?(substring)
        memo[start_idx + length] = true
      end
      
      length += 1
    end
    
    start_idx += 1
  end
  
  memo[s.length]
end