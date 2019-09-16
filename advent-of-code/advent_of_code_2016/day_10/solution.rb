# Refactored to get rid of these class variables and improve overall design
# Each bot is initialized with id and factory object, so that he has access the other bots/outputs

class Factory
  VALUES = [17, 61]
  attr_reader :input, :bots, :outputs
  attr_accessor :looked_for_bot

  def initialize(input)
    @input = input
    @bots = {}
    @outputs = {}
    @looked_for_bot = nil
    create_bots
  end

  def output_solutions
    shuffle_chips
    puts looked_for_bot
    puts outputs[0] * outputs[1] * outputs[2]
  end

  private

  def create_bots
    input.scan(/bot \d+/).uniq.map do |bot_id|
      id = bot_id.scan(/\d+/)[0].to_i
      bots[id] = Bot.new(id, self)
    end
  end

  def shuffle_chips
    parse_initial_instructions
    parse_shuffling_instructions
  end

  def parse_initial_instructions
    instructions = input.split("\n").select { |string| string.match?(/value/) }

    instructions.each do |string|
      value, id = string.scan(/\d+/).map(&:to_i)
      bots[id].receive_chip(value)
    end
  end

  def parse_shuffling_instructions
    instructions = input.split("\n").select { |string| string.match?(/^bot/) }

    instructions.each do |string|
      id = string.scan(/\d+/).map(&:to_i)[0]
      bots[id].save_instruction(string)
    end
  end
end

class Bot
  attr_reader :id, :factory
  attr_accessor :chips, :give_low_to, :give_high_to

  def initialize(id, factory)
    @id = id
    @factory = factory
    @chips = []
    @give_low_to = nil
    @give_high_to = nil
  end

  def receive_chip(value)
    chips << value
    factory.looked_for_bot = id if chips.sort == Factory::VALUES
    pass_on_chips if ready_to_handle
  end

  def save_instruction(string)
    tokens = string.scan(/bot \d+|output \d+/)
    self.give_low_to = parse_instruction(tokens[1])
    self.give_high_to = parse_instruction(tokens[2])
    pass_on_chips if ready_to_handle
  end

  private

  def parse_instruction(string)
    receiver = string.scan(/bot|output/)[0]
    id = string.scan(/\d+/)[0].to_i
    { receiver: receiver, id: id }
  end

  def ready_to_handle
    chips.length == 2 && give_low_to && give_high_to
  end

  def pass_on_chips
    self.chips = chips.sort
    min, max = chips[0], chips[1]

    give_chip(min, give_low_to)
    give_chip(max, give_high_to)
  end

  def give_chip(value, instruction)
    id = instruction[:id]

    if instruction[:receiver] == 'bot'
      factory.bots[id].receive_chip(value)
    else
      factory.outputs[id] = value
    end
  end
end

input = File.read('input.txt').chomp

factory = Factory.new(input)
factory.output_solutions
