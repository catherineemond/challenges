class RunLengthEncoding
  def self.encode(input)
    groups = split_in_groups_of_consecutive_chars(input)
    groups.map do |group|
      size = group.size
      size = nil if size == 1
      "#{size}#{group.first}"
    end.join
  end

  def self.decode(input)
    groups = split_in_char_counts(input)
    groups.each_with_object('') do |group, output|
      output <<
        if group.size == 1
          group.first
        else
          (group.last * group.first.to_i)
        end
    end
  end

  def self.split_in_groups_of_consecutive_chars(input)
    input.chars.each_with_object([]) do |char, groups|
      if groups.empty? || !groups.last.include?(char)
        groups << [char]
      else
        groups.last << char
      end
    end
  end

  def self.split_in_char_counts(input)
    input.scan(/\d*\D{1}/).map { |count| count.scan(/\d+|\D/) }
  end
end
