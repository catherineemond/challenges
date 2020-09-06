# Implementation of Bubble Sort

array = [4, 2, 7, 1, 3]

def bubble_sort(array)
  swap = true
  final_index = array.length - 1
  
  while (swap) do
    swap = bubble_through(array, final_index)
    final_index -= 1
  end

  array
end

def bubble_through(array, final_index)
  index = 0
  swapped = false
  
  while (index < final_index) do
    first = array[index]
    second = array[index + 1]
    
    if first > second
      array[index], array[index + 1] = second, first
      swapped = true
    end

    index += 1
  end

  swapped
end

p bubble_sort(array) == [1, 2, 3, 4, 7]
p bubble_sort([5, 4, 3, 2, 1, 0]) == [0, 1, 2, 3, 4, 5]