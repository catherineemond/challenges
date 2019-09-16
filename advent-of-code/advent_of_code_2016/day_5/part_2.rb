require 'digest'
require 'benchmark'

puts Benchmark.measure {
  input = 'reyedfim'
  index = 0
  password = Array.new(8, nil)

  loop do
    index += 1
    hash = Digest::MD5.hexdigest(input + index.to_s)

    if hash.match?(/\A00000.+/)
      position = hash[5]
      next unless position.match?(/[0-7]/)
      position = position.to_i
      next unless password[position].nil?

      password[position] = hash[6]
      break unless password.include?(nil)
    end
  end

  p password.join
}
