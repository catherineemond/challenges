class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    count = 0
    @strand.chars.each_with_index do |char, idx|
      break if other_strand[idx].nil?
      count += 1 if other_strand[idx] != char
    end
    count
  end

  # one-liner (student solution):
  def hamming_distance(other_strand)
    @strand.chars.zip(other_strand.chars).count { |a, b| a != b && b != nil }
  end
end
