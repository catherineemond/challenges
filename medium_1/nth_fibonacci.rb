# Playing with Enumerator...
# Starting at 0

class Fibonacci
  @fibonacci_serie = Enumerator.new do |yielder|
    first, second = [0, 1]

    yielder << first
    yielder << second

    loop do
      current_number = first + second
      yielder << current_number
      first, second = second, current_number
    end
  end

  def self.nth(target)
    @fibonacci_serie.take(target).last
  end
end

p Fibonacci.nth(10) == 34
p Fibonacci.nth(100) == 218922995834555169026
p Fibonacci.nth(300) == 137347080577163115432025771710279131845700275212767467264610201
p Fibonacci.nth(1000)
