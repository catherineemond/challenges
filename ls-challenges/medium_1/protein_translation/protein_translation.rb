=begin
input:
  - string of one codon (three cap letters)
  - string of many codons joined together without spaces

output:
  - string giving the protein name capitalized (the of_codon method)
  - array of protein names (the of_strand method)

Notes:
  - two class methods
  - of_codon: translates a single three letters codon
  - of_rna: translates a strand (=more than one codon)
    - how do I split the string? => always three upcase letters
    - how do I know when to stop? => return when I meet the STOP codon
=end

class InvalidCodonError < StandardError; end

module Translation
  PROTEIN_CONVERSION =
  {
    %w(AUG)              => 'Methionine',
    %w(UUU UUC)          => 'Phenylalanine',
    %w(UUA UUG)          => 'Leucine',
    %w(UCU UCC UCA UCG)  => 'Serine',
    %w(UAU UAC)          => 'Tyrosine',
    %w(UGU UGC)          => 'Cysteine',
    %w(UGG)              => 'Tryptophan',
    %w(UAA UAG UGA)      => 'STOP'
  }

  def Translation.of_codon(codon)
    raise InvalidCodonError unless valid?(codon)
    PROTEIN_CONVERSION.each do |codons, protein|
      return protein if codons.include?(codon)
    end
  end

  def Translation.of_rna(strand)
    codons = strand.scan(/\w{3}/)
    codons.each_with_object([]) do |codon, translation|
      return translation if of_codon(codon) == 'STOP'
      translation << of_codon(codon)
    end
  end

  def self.valid?(codon)
    return false unless codon.is_a?(String)
    PROTEIN_CONVERSION.keys.flatten.include?(codon)
  end
end
