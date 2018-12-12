class SecretHandshake
  def initialize(input)
    @binary_string = convert_to_binary(input)
    @events = ['wink', 'double blink', 'close your eyes', 'jump']
  end

  def commands
    commands = []
    @binary_string.chars.reverse.each_with_index do |digit, idx|
      break commands.reverse! if idx == 4 # this also takes care of longer numbers
      commands << @events[idx] if digit == '1'
    end
    commands
  end

  private

  def convert_to_binary(input)
    case input
    when Integer then input.to_s(2)
    when String  then input.match?(/\d+/) ? input : '0'
    end
  end
end
