# I'm looking for 4 char sequence of type abba: two characters followed by the reverse of that pair
# But: the ip must NOT have an abba sequence within hypernet sequences -> sequence within square brackets

# step 1: find a way to identify the abba sequences (regex?)
# step 2: eliminate any address that has an abba sequence within square brackets
# step 3: select any remaining address that has an abba sequence

# Note: aaaa is not a valid abba sequence.

ABBA_PATTERN = /(\w)(\w)(\2)(\1)/

def get_hypernet_sequences(string)
  string.scan(/\[\w*\]/)
end

def contains_valid_pattern?(string)
  matches = string.scan(ABBA_PATTERN)
  matches.any? { |arr| arr.uniq.size > 1 }
end

ip_addresses = File.read('input.txt').split("\n")

filtered_addresses = ip_addresses.reject do |address|
  get_hypernet_sequences(address).any? { |sequence| contains_valid_pattern?(sequence) }
end

p filtered_addresses.select { |address| contains_valid_pattern?(address) }.size
