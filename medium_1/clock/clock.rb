class Clock
  attr_accessor :minutes

  def initialize(mins)
    @minutes = mins
  end

  def self.at(hours=0, mins=0)
    mins = (hours * 60) + mins
    Clock.new(mins)
  end

  def to_s
    hours, mins = @minutes.divmod(60)
    hours %= 24
    format('%02d:%02d', hours, mins)
  end

  def +(mins)
    @minutes += mins
    self # could be better to return a new Clock object, this mutates the original caller
  end

  def -(mins)
    @minutes -= mins
    self # could be better to return a new Clock object, this mutates the original caller
  end

  def ==(other)
    minutes == other.minutes
  end
end
