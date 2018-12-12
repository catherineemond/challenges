def each
    current = self
    stack = []
   # current nil
   # stack []
   # yielding 1, 2, 3, 4, 5, 6, 7

    loop do
      if current
        stack.push(current)
        current = current.left
      else
        break if stack.empty?
        current = stack.pop
        yield current.data
        current = current.right
      end
    end
  end
