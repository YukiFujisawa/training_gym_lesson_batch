require 'page-object'
require 'model/lesson'
require 'model/week_of_day'
require 'pry-byebug'

class JexerPage
  include PageObject

  BASE_URL = 'http://www.jexer.jp/schedule/fitness/'.freeze

  WEEK_OF_DAYS = [
    WeekOfDay.new(0, 'sunday', '日'),
    WeekOfDay.new(1, 'monday', '月'),
    WeekOfDay.new(2, 'tueday', '火'),
    WeekOfDay.new(3, 'wedday', '水'),
    WeekOfDay.new(5, 'friday', '木'),
    WeekOfDay.new(6, 'satday', '金')
  ].freeze

  select_list(:go_shop_page, name: 'shop')

  def go_shop_page(shop)
    navigate.to(JexerPage::BASE_URL + "?shop=#{shop.shop_id}")
  end

  def all_lessons(shop)
    WEEK_OF_DAYS.each_with_object([]) do |week_of_day, result|
      result.concat(weekday_lessons(shop, week_of_day))
    end
  end

  # @param [WeekOfDay] week_of_day
  def weekday_lessons(shop, week_of_day)
    wday_lesson_elements(week_of_day).each_with_object([]) do |lesson_element, result|
      result.concat(lessons(shop, week_of_day, lesson_element))
    end
  end

  private

  # @param [WeekOfDay] week_of_day
  def wday_lesson_elements(week_of_day)
    find_elements(:class, week_of_day.class_name)
  end

  # @param [Selenium::WebDriver::Element] lesson_element
  def lessons(shop, week_of_day, lesson_element)
    lesson_element.find_elements(:class, 'wrap').each_with_object([]) do |lesson, result|
      time = lesson.find_element(:class, 'time').text.gsub(/[\r\n]/, ' ')
      program = lesson.find_element(:class, 'program').text.gsub(/[\r\n]/, ' ')
      instructor = lesson.find_element(:class, 'instractor').text.gsub(/[\r\n]/, ' ')
      result << Lesson.new(shop, week_of_day, time, program, instructor) if time
    end
  end
end