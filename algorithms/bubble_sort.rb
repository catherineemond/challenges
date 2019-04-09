# seems to be one case where mutating the array as we're iterating through it does exactly what we want.

# there are better ways to do this, especially taking into account that for each passthrough the last value of the array is now sorted and we can ignore it.

array = [4, 2, 7, 1, 3, 5, 10, 0, -2]

def bubble_sort(array)
  final_idx = -1

  loop do
    swap_count = 0

    array.each_with_index do |el, idx|
      break if idx == array.size - 1
      next_value = array[idx + 1]

      if el > next_value
        swap(array, idx)
        swap_count += 1
      end
    end

    return array if swap_count.zero?
  end
end

def swap(array, idx)
  array[idx], array[idx + 1] = array[idx + 1], array[idx]
end

p bubble_sort(array)
