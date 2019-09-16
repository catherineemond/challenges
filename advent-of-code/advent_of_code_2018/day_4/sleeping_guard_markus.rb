class GuardSchedule
  def initialize
    @logs = File.readlines("input.txt").map(&:chomp).sort
    @guard_shifts = Hash.new { |hsh, key| hsh[key] = [] }
    process_logs
  end

  def process_logs
    active_guard, start_minute = nil, nil
    @logs.each do |event|
      active_guard = event[/(?<=#)\d+/]         if event[/(?<=#)\d+/]
      start_minute = event[/(?<=\:)\d{2}/].to_i if event[/falls asleep/]
      if event[/wakes up/]
        @guard_shifts[active_guard] << ((start_minute...event[/(?<=\:)\d{2}/].to_i).to_a)
      end
    end
  end

  def find_sleepiest_guard
    @guard_shifts.max_by do |_, v|
      v.flatten.count
    end
  end

  def find_id_and_best_minute
    guard_id, minutes_asleep = find_sleepiest_guard
    occurences = @guard_shifts[guard_id].flatten.each_with_object(Hash.new(0)) do |min, hsh|
      hsh[min] += 1
    end
    best_minute = occurences.select { |k, v| v == occurences.values.max }.keys.last
    guard_id.to_i * best_minute # solution for part 1
  end
end

p GuardSchedule.new.find_id_and_best_minute
