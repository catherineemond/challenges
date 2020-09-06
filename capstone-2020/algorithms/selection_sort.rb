array = [4, 2, 7, 1, 3]

def selection_sort(array)
  start_index = 0
  
  while start_index < array.length - 1 do
    swap_index = start_index
    
    start_index.upto(array.length - 1) do |current_index|
      if array[swap_index] > array[current_index]
        swap_index = current_index
      end
    end
    
    if swap_index != start_index
      array[start_index], array[swap_index] = array[swap_index], array[start_index]
    end
    
    start_index += 1
  end

  array
end

p selection_sort(array) == [1, 2, 3, 4, 7]
p selection_sort([5, 4, 3, 2, 1, 0]) == [0, 1, 2, 3, 4, 5]