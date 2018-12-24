class WeekOfDay
  attr_reader :wday, :class_name, :day_name

  def initialize(wday, class_name, day_name)
    @wday = wday
    @day_name = day_name
    @class_name = class_name
  end
end