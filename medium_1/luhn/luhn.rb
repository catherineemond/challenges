class Luhn
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def addends
    @number.digits.map.with_index do |num, idx|
      next num if idx.even?
      num * 2 > 10 ? num * 2 - 9 : num * 2
    end.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    (checksum % 10).zero?
  end

  def self.create(number)
    luhn = new(number * 10)
    return luhn.number if luhn.valid?
    last_number = 10 - (luhn.checksum % 10)
    number * 10 + last_number
  end
end
