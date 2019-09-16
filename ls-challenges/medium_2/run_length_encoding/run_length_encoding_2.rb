module RunLengthEncoding
  def self.encode(string)
    split_in_char_groups(string).each_with_object('') do |group, result|
      count = group.size
      count = '' if count == 1
      result << count.to_s << group.first
    end
  end

  def self.decode(string)
    string.scan(/\d*.{1}/).map do |token|
      count = token.slice!(/\d+/).to_i
      count = 1 if count == 0
      token * count
    end.join
  end

  def self.split_in_char_groups(string)
    string.chars.each_with_object([]) do |char, char_groups|
      if char_groups.empty? || !char_groups.last.include?(char)
        char_groups << [char]
      else
        char_groups.last << char
      end
    end
  end
end
