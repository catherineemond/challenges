array = [4, 2, 7, 1, 3]

def insertion_sort(array)
  start_index = 1

  while start_index < array.length do
    current_index = start_index
    temp_value = array[start_index]
    new_index = nil

    (start_index - 1).downto(0) do |index|
      if array[index] > temp_value
        array[current_index] = array[index]
        current_index -= 1
        new_index = index
      end
    end
    
    if new_index
      array[new_index] = temp_value
    end

    start_index += 1
  end

  array
end

p insertion_sort(array) == [1, 2, 3, 4, 7]
p insertion_sort([5, 4, 3, 2, 1, 0]) == [0, 1, 2, 3, 4, 5]