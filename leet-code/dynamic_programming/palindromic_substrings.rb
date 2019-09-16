require 'pry'

# smaller subproblems: how many palindromic substring in a shorter subsequence
# basecase: one char is one palindrome

# naive implementation

# def count_substrings(s)
#   count = 0
#
#   s.chars.each_with_index do |start, idx1|
#     count += 1
#     s.chars.each_with_index do |char, idx2|
#       next if idx2 <= idx1
#       start << char
#       count += 1 if palindrome?(start)
#     end
#   end
#
#   count
# end
#
# def palindrome?(string)
#   string == string.reverse
# end

#-----------------------------------------------------------------
# dp solution

def count_substrings(s)
  size = s.size
  count = 0

  # the matrix represents substrings from one idx to another
  # we use the length of the string to determine the size
  # we start with all false values and update it to true when the substring is a palindrome

  dp = Array.new(size) { Array.new(size, false) }

  # substrings of one char are all palindromes

  (0...size).each do |idx|
    dp[idx][idx] = true
    count += 1
  end

  # check substrings of two chars
  # only if the 2 chars as the same will it be a palindrome

  (1...(size - 1)).each do |idx|
    if s[idx] == s[idx + 1]
      dp[idx][idx + 1] = true
      count += 1
    end
  end

  p dp

  # check longer substrings

  # this first loop represents the length of the substring, from 3 up to the total size of the original string

  (3..size).each do |length|
    # then we iterate according to index
    (0...(size - length)).each do |idx1|
      idx2 = (idx1 + length) - 1
      if dp[idx1 + 1][idx2 - 1] && (s[idx1] == s[idx2])
        dp[idx1][idx2] = true
        count += 1
        binding.pry
      end
    end
  end

  count
end

# Markus

def count_substrings(string)
  length = string.length
  mem    = Array.new(length) { Array.new(length, false) }

  (0..length - 1).each { |n| mem[n][n] = true } # 1 character is always a palindrome

  (0..length - 2).each do |n|
    # check for possible 2 character palindromes
    mem[n][n + 1] = true if string[n] == string[n + 1]
  end

  (3..length).each do |l|
    (0...length - l + 1).each do |n|
      if string[n] == string[n + l - 1] && mem[n + 1][n + l - 2]
        mem[n][n + l - 1] = true
      end
    end
  end
  mem.flatten.count(true)
end

p count_substrings('abc')
p count_substrings('aaa')
p count_substrings('fdsklf')
