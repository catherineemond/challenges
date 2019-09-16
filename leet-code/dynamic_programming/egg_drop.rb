# - try to work out a recursive solution first
# - we are trying to minimize(min) the worst case scenario(max)
# - Gaurav Sen's formula:

# where n = floors and e = eggs

# f(n, e) = min( max( f(n-x, e), f(x-1, e-1) ) + 1 )

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

  # filling up the matrix
  (2..floors).each do |floor|
    (2..eggs).each do |egg_number|
      # assigning a random high number
      results[floor][egg_number] = Float::INFINITY
      # first looking for the worst-case
      (1..floor).each do |current_floor|
        broken_egg = results[current_floor - 1][egg_number - 1]
        unbroken_egg = results[floor - current_floor][egg_number]
        # get the max, i.e. worst-case, add one for the current drop
        current_result = [broken_egg, unbroken_egg].max + 1
        # save the value if it's the minimum
        results[floor][egg_number] = current_result if current_result < results[floor][egg_number]
      end
    end
  end

  results[floors][eggs]
end

# Markus

def egg_drop(floors, eggs)
  return floors if eggs == 1 || floors == 1 || floors == 0
  min = Float::INFINITY
  (1..floors).each do |floor|
      drops = [
        egg_drop(eggs - 1, floor - 1), # egg breaks
        egg_drop(eggs, floors - floor)  # egg does not break
      ].max
      min = drops if drops < min
  end
  min + 1
end

p egg_drop(2, 1) #== 2
p egg_drop(6, 2) #== 3
p egg_drop(14, 3) #== 4
p egg_drop(10, 2) #== 4
p egg_drop(100, 2) #== 14
