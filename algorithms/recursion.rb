def count_down(num)
  loop do
    puts num
    num -= 1
    break if num < 0
  end
end

def recursive_count_down(num)
  return if num < 0
  puts num
  recursive_count_down(num - 1)
end

recursive_count_down(10)
