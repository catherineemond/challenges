input = File.read('./input.txt')

class LogParser # :nodoc:
  attr_reader :guards

  def initialize(input)
    @guards = {}
    parse(input)
  end

  def parse(input)
    entries = input.split("\n").sort
    guard_id = nil
    starting_sleep_time = nil

    entries.each do |entry|
      action = parse_action(entry)

      case action
      when 'begins shift'
        guard_id = parse_guard_id(entry)
      when 'falls asleep'
        starting_sleep_time = parse_minutes(entry)
      else
        finish_sleep_time = parse_minutes(entry)
        time_asleep = finish_sleep_time - starting_sleep_time
        minutes_asleep = (starting_sleep_time...finish_sleep_time).to_a
        update_data(guard_id, minutes_asleep, time_asleep)
      end
    end
  end

  def parse_action(entry)
    entry.match(/falls asleep|wakes up|begins shift/).to_s
  end

  def parse_guard_id(entry)
    id = entry.match(/Guard #\d+/).to_s
    id.match(/\d+/).to_s.to_i
  end

  def parse_minutes(entry)
    entry.match(/:\d+/).to_s[1..-1].to_i
  end

  def update_data(guard_id, minutes_asleep, time_asleep)
    @guards[guard_id] = Guard.new(guard_id) unless @guards[guard_id]
    @guards[guard_id].minutes += minutes_asleep
    @guards[guard_id].total_time_asleep += time_asleep
  end

  def find_most_sleepy_guard
    @guards.values.max_by(&:total_time_asleep)
  end

  def find_minute_most_slept
    @guards.values.max_by(&:max_same_minute_sleep)
  end
end

class Guard # :nodoc:
  attr_accessor :total_time_asleep, :minutes
  attr_reader :id

  def initialize(id)
    @id = id
    @total_time_asleep = 0
    @minutes = []
  end

  def minute_count
    @minutes.each_with_object(Hash.new(0)) { |min, count| count[min] += 1 }
  end

  def max_same_minute_sleep
    minute_count.values.max
  end

  def minute_most_asleep
    minute_count.key(max_same_minute_sleep)
  end
end

log = LogParser.new(input)

guard1 = log.find_most_sleepy_guard
p guard1.id * guard1.minute_most_asleep

guard2 = log.find_minute_most_slept
p guard2.id * guard2.minute_most_asleep
