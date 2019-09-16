# step 1
# check address form ABA pattern (exclude the hypernet sequence)
# must find a way to get ALL sequences, i.e. zazbz has both zaz AND zbz
# step 2
# get the BAB pattern and see if the hypernet sequence matches

ABA_PATTERN = /(\w)(\w)(\1)/

def get_hypernet_sequences(string)
  string.scan(/\[\w*\]/)
end

def get_aba_patterns(string)
  patterns = []
  supernet_sequences = string.gsub(/\[\w*\]/, ' ').split(' ')

  supernet_sequences.each do |sequence|
    sequence.chars.each_cons(3) { |trio| patterns << trio if trio.join.match?(ABA_PATTERN) }
  end

  patterns.select { |pattern| pattern.uniq.size > 1 }
end

def get_bab_pattern(array)
  a = array[0]
  b = array[1]
  [b, a, b].join
end

ip_addresses = File.read('input.txt').split("\n")
valid_ip = 0

ip_addresses.each do |address|
  patterns = get_aba_patterns(address)
  hypernet_sequences = get_hypernet_sequences(address)

  patterns.each do |pattern|
    bab = get_bab_pattern(pattern)
    break valid_ip += 1 if hypernet_sequences.any? { |sequence| sequence.match?(bab) }
  end
end

p valid_ip
