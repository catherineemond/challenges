require 'digest'

input = 'reyedfim'
index = 0
password = ''

loop do
  hash = Digest::MD5.hexdigest(input + index.to_s)
  password << hash[5] if hash.match?(/\A00000.+/)
  break if password.length == 8
  index += 1
end

p password
