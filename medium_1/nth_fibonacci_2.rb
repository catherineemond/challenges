class Fibonacci
  def self.nth(target)
    fib = [1, 1]
    while fib.length < target
      fib << (fib[-2] + fib[-1])
    end
    fib.last
  end
end

#10.times { |num| puts Fibonacci.nth(num + 1) }
p Fibonacci.nth(10000)
