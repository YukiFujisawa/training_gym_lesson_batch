require 'nkf'

class Lesson
  attr_reader :wday, :wday_name, :time, :program, :instructor

  def initialize(shop, day_of_week, time, program, instructor)
    @wday = day_of_week.wday
    @wday_name = day_of_week.day_name
    @shop_id = shop.shop_id
    @shop_name = shop.shop_name
    @time = NKF.nkf('-m0Z1 -W -w', time).gsub(/[\s　]/, '')
    @program = NKF.nkf('-m0Z1 -W -w', program).gsub(/[[\s　]]/, ' ')
    @instructor = NKF.nkf('-m0Z1 -W -w', instructor).gsub(/[\s　]/, '')
  end

  def to_csv
    "#{@shop_id},#{@shop_name},#{@wday},#{@wday_name},#{@time},#{@program},#{@instructor}"
  end
end