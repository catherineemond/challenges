class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(new_data)
    if new_data <= @data
      @left ? @left.insert(new_data) : @left = Bst.new(new_data)
    elsif new_data > @data
      @right ? @right.insert(new_data) : @right = Bst.new(new_data)
    end
  end

  def each
    if block_given?
      tree_sort.each { |data| yield (data) }
    else
      tree_sort.each
    end
  end

  # refactoring of my first try:
  # BUT: better to simply use the recursion inside the each method, to yield the elements in the right order
  # see Markus' second solution for implementation
  def tree_sort(array=[])
    left.tree_sort(array) if left
    array << data
    right.tree_sort(array) if right
    array
  end

  # First clumsy try was:
  def tree_sort(array=[])
    return array << data if !right && !left

    if left
      array = left.tree_sort(array) << data
    else
      array << data
    end

    array + right.tree_sort(array) if right
    array
  end
end
