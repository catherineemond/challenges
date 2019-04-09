def bubble_sort!(array)
  ending_index = array.size - 1
  sorted = false

  while ending_index > 0 && sorted == false
    sorted = true
    (0..ending_index - 1).each do |index|
      if array[index] > array[index + 1]
        sorted = false
        array[index], array[index + 1] = array[index + 1], array[index]
      end
    end

    ending_index -= 1
  end
end

def selection_sort!(array)
  starting_index = 0

  while starting_index <= array.length - 2
  # one less because last passthrough is moot
    index_of_lowest = starting_index

    (starting_index + 1..array.length - 1).each do |index|
      if array[index] < array[index_of_lowest]
        index_of_lowest = index
      end
    end

    if index_of_lowest != starting_index
      array[index_of_lowest], array[starting_index] =
        array[starting_index], array[index_of_lowest]
    end
    starting_index += 1
  end
end

def insertion_sort!(array)
  insertion_index = 1

  while insertion_index < array.length
    position = insertion_index
    temp = array[insertion_index]

    while array[position - 1] > temp && position > 0
      array[position] = array[position - 1]
      array[position - 1] = nil
      position -= 1
    end

    array[position] = temp
    insertion_index += 1
  end
end
