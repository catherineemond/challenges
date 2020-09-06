def valid?(line)
  stack = []
  all_braces = /[()\[\]{}]/
  opening_braces = /[(\[{]/
  closing_braces = /[)\]}]/
  
  line.chars.each do |char|
    next if !char.match?(all_braces)
    
    if char.match?(opening_braces)
      stack.push(char)
    elsif char.match?(closing_braces)
      if stack.empty?
        return 'Syntax Error Type #2'
      elsif char == ')'
        return 'Syntax Error Type #3' unless stack.pop == '('
      elsif char == ']'
        return 'Syntax Error Type #3' unless stack.pop == '['
      elsif char == '}'
        return 'Syntax Error Type #3' unless stack.pop == '{'
      end
    end
  end

  stack.empty? ? true : 'Syntax Error Type #1' 
end

line1 = '(var x = {y: [1, 2, 3]})'

p valid?(line1) == true
p valid?('()]') == 'Syntax Error Type #2'
p valid?('()[)') == 'Syntax Error Type #3'
p valid?('(())[') == 'Syntax Error Type #1'