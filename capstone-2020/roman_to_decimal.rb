ROMAN_DIGITS = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000
}

def roman_to_int(s)
  total = 0
  numbers = s.chars.map { |digit| ROMAN_DIGITS[digit] }
  idx = 0
  
  while (idx < numbers.length) do
    if idx == numbers.length - 1 || numbers[idx] >= numbers [idx + 1]
      total += numbers[idx]
      idx += 1
    elsif
      total += (numbers[idx + 1] - numbers[idx])
      idx += 2
    end
  end

  total
end