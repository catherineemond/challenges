=begin
If number less than 10 digits:
  => bad number
If number is 10 digits:
  => good number
If number is 11 digits and first number is 1:
  => trim the 1 and use the last 10 digits
If number is 11 digits and first number is not 1:
  => then it is a bad number
If number is more than 11 digits
  => bad number
=end

class PhoneNumber
  attr_reader :number, :area_code

  def initialize(string_number)
    @number = validate(string_number)
    @area_code = @number[0..2]
  end

  def to_s
    number.gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  end

  private

  def validate(string_number)
    return invalid_number unless string_number.chars.all? do |char|
      char.match? (/\d|\s|[().\-]/)
    end

    digits = string_number.scan(/\d/)

    if    digits.size == 10                        then digits.join
    elsif digits.size == 11 && digits.first == '1' then digits[1..-1].join
    else  invalid_number
    end
  end

  def invalid_number
    '0000000000'
  end
end
