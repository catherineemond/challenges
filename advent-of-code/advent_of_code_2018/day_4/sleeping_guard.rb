# organize the entries
# find the guard that has the most minutes asleep
# what minute does that guard fall asleep the most
# return id of guard * minute most asleep

input = File.read('./input.txt')

class LogParser
  attr_reader :log_entries

  def initialize(input)
    @log_entries = parse(input)
    @guards_data = 
  end

  def parse(input)
    entries = input.split("\n").sort
    previous_id = nil

    entries.map do |entry|
      time = entry.match(/\[.*\]/).to_s
      action = entry.match(/asleep|wakes up|begins shift/).to_s
      id = entry.match(/Guard #\d+/).to_s

      id == "" ? id = previous_id : previous_id = id

      LogEntry.new(time, action, id)
    end
  end
end

class LogEntry
  def initialize(time, action, id)
    @minutes = parse_minutes(time)
    @guard_id = parse_guard_id(id)
    @action = action
  end

  def parse_minutes(time)
    time.match(/:\d+/).to_s[1..-1].to_i
  end

  def parse_guard_id(id)
    id.match(/\d+/).to_s.to_i
  end
end

p LogParser.new(input).log_entries
