class SortableArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def quicksort!(left_index = 0, right_index = array.length - 1)
    return if right_index - left_index <= 0

    pivot_position = partition!(left_index, right_index)

    quicksort!(left_index, pivot_position - 1)
    quicksort!(pivot_position + 1, right_index)
  end

  def quickselect!(nth_value, left_index = 0, right_index = array.length - 1)
    return array[left_index] if right_index - left_index <= 0

    pivot_position = partition!(left_index, right_index)

    if nth_value < pivot_position
      quickselect!(nth_value, left_index, pivot_position - 1)
    elsif nth_value > pivot_position
      quickselect!(nth_value, pivot_position + 1, right_index)
    else
      return array[pivot_position]
    end
  end

  def partition!(left_pointer, right_pointer)
    pivot_position = right_pointer
    pivot = array[pivot_position]

    right_pointer -= 1

    while true do
      left_pointer += 1 while array[left_pointer] < pivot
      right_pointer -= 1 while array[right_pointer] > pivot
      break if left_pointer >= right_pointer
      swap!(left_pointer, right_pointer)
    end

    swap!(left_pointer, pivot_position)
    return left_pointer
  end

  private

  def swap!(first_pointer, second_pointer)
    array[first_pointer], array[second_pointer] = array[second_pointer], array[first_pointer]
  end
end

array = SortableArray.new([0, 5, 2, 1, 6, 3])
array.quicksort!
p array.array

#----------------

array = SortableArray.new([0, 50, 20, 10, 60, 30])
p array.quickselect!(1) # => 10
p array.quickselect!(4) # => 50