require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
    @possible_dates = {
      first:  [*1..7],
      second: [*8..14],
      third:  [*15..21],
      fourth: [*22..28],
      teenth: [*13..19]
    }
    adjust_last_dates_to_month_length # this could be replaced by adding last: [*-7..-1] to the hash
  end

  def day(weekday, schedule)
    weekday = weekday.to_s + '?'

    @possible_dates[schedule].each do |num|
      date = Date.new(@year, @month, num)
      return date if date.send(weekday)
    end
  end

  private

  def days_in_month
    Date.new(@year, @month, -1).day
  end

  def adjust_last_dates_to_month_length
    last_day = days_in_month
    @possible_dates[:last] = [*(last_day - 6)..last_day]
  end
end
