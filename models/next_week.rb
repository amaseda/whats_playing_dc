require "date"

class NextWeek
  def self.start
    today = Date.today
    next_monday = today + ((1 - today.wday) % 7)
    next_monday
  end
  def self.end
    next_sunday = self.start + ((7 - self.start.wday) % 7)
    next_sunday
  end
end