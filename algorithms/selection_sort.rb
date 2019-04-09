array = [4, 2, 7, 1, 3]

def selection_sort(arr)
  starting_index = 0
  final_index = arr.size - 1

  loop do
    smallest_index = starting_index

    starting_index.upto(final_index).each do |index|
      if arr[index] < arr[smallest_index]
        smallest_index = index
      end
    end

    swap!(arr, starting_index, smallest_index)
    starting_index += 1
    break if starting_index == final_index
  end

  arr
end

def swap!(arr, first_index, second_index)
  arr[first_index], arr[second_index] = arr[second_index], arr[first_index]
end

p selection_sort(array)
