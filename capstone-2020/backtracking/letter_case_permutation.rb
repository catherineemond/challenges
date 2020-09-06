# I went a different road and decided to mutate an array of chars instead of building candidates

def letter_case_permutation(s)
  results = []
  backtrack(s.chars, 0, results)
  results
end

def backtrack(chars, idx, results)
  results << chars.join
  
  if idx == chars.length
    return
  end
  
  (idx..chars.length - 1).each do |idx|
    next if !chars[idx].match?(/[a-zA-Z]/)
    
    chars[idx] = swap_case(chars[idx])
    backtrack(chars, idx + 1, results)
    chars[idx] = swap_case(chars[idx])
  end
end

def swap_case(char)
  char == char.upcase ? char.downcase : char.upcase
end