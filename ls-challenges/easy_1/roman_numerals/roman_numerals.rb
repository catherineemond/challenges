=begin
I=1
V=5
X=10
L=50
C=100
D=500
M=1000

upto 3000

writing each digit separately, starting from the left,
skipping any digit with a value of zero

ex. 1990 => MCMXC

1000=M
900=CM
90=XC

ex2. 2008 => MMVIII

2000=MM
8=VIII

input: the method will be called on an Integer
output: a string, roman number
=end

class Integer
  def to_roman
    thousands, rest = self.divmod(1000)
    hundreds, rest = rest.divmod(100)
    tens, units = rest.divmod(10)

    format_roman(thousands, hundreds, tens, units)
  end

  private

  def format_roman(thousands, hundreds, tens, units)
    convert(thousands, 'M', '', '')  +
    convert(hundreds, 'C', 'D', 'M') +
    convert(tens, 'X', 'L', 'C')     +
    convert(units, 'I', 'V', 'X')
  end

  def convert(num, basic_unit, five_unit, next_unit)
    case
    when num <  4 then basic_unit * num
    when num == 4 then basic_unit + five_unit
    when num == 5 then five_unit
    when num <  9 then five_unit + (basic_unit * (num % 5))
    when num == 9 then basic_unit + next_unit
    end
  end
end
