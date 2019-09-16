def egg_drop(floors, eggs)
  # an array of arrays to store the values (building my dp matrix)
  # + 1 to include 0 floors
  results = []
  (floors + 1).times { results << [] }

  # defining my base cases
  (0..floors).each do |floor|
    results[floor][1] = floor
    results[floor][0] = 0
  end

  (0..eggs).each do |egg_number|
    results[1][egg_number] = 1
    results[0][egg_number] = 0
  end

  (2..floors).each do |floor|
    eggs_dropped = 1
    (2..eggs).each do |egg_number|
      while eggs_dropped < egg_number + 1
        if results[floor][eggs_dropped - 1] >= results[floor - 1][egg_number - eggs_dropped]
          results[floor][egg_number] = 1 + results[floor][eggs_dropped - 1]
          break
        end
        eggs_dropped += 1
      end
    end
  end

  results[-1][-1]
end

p egg_drop(2, 1) #== 2
p egg_drop(6, 2) #== 3
p egg_drop(14, 3) #== 4
p egg_drop(10, 2) #== 4
p egg_drop(100, 2) #== 14
