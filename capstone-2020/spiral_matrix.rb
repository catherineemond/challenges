def spiral_order(matrix)
  results = []

  while (!matrix.empty?)
    first_row = matrix.shift
    
    while (!first_row.empty?) 
      results.push(first_row.shift)
    end

    matrix.each { |row| results.push(row.pop) }
    
    matrix = clean_up(matrix)
    break if matrix.empty?

    last_row = matrix.pop

    while (!last_row.empty?)
      results.push(last_row.pop)
    end

    matrix.reverse.each { |row| results.push(row.shift) }
    matrix = clean_up(matrix)
  end

  results
end

def clean_up(matrix)
  matrix.select { |row| !row.empty? }
end