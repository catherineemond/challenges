def countdown(number)
  number.downto(0) { |n| puts n }
  puts 'Launch!'
end

countdown(10)

#--------------

def recursive_countdown(number)
  return puts 'Launch!' if number < 0
  puts number
  recursive_countdown(number - 1)
end

recursive_countdown(10)