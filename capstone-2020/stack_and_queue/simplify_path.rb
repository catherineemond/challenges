# -> LIFO -> Stack

# "/a   /. /b  /..  /..  /c  /"  => '/c'

# ['/c, '/'] => '/c'

# '/../' => '/'

# - '/' are the delimiters (or end of the string)
# - if we meet a normal path '/a' -> push to stack
# - if we meet a '/.' || '/' -> we just keep going
# - if we meet a '/..' -> we pop the stack and keep going

# '/'

# '/..'

# "/c"

def simplify_path(path) 
  stack = []
  token = ''
  
  path.chars.each_with_index do |char, idx|
    next if idx == 0
    
    unless char =='/' || idx == path.length - 1 
      token += char
      next
    end
    
    if idx == path.length - 1 && char != '/'
      token += char
    end
      
    if token == '.' || token.empty?
      token = ''
    elsif token == '..'
      stack.pop
    else
      stack << ('/' + token)
    end

    token = ''
  end
  
  new_path = stack.join
  new_path.empty? ? '/' : new_path
end