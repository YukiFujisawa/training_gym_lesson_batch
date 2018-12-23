require 'page-object'
require 'model/lesson'

class JexerPage
  include PageObject

  BASE_URL = 'http://www.jexer.jp/schedule/fitness/'.freeze

  select_list(:shop_select, name: 'shop')

  def shop_select(shop_id)
    navigate.to(JexerPage::BASE_URL + "?shop=#{shop_id}")
  end

  def lessons
    result = []
    find_elements(:class, 'wrap').each do |element|
      time = element.find_element(:class, 'time').text.gsub(/[\r\n]/, '')
      program = element.find_element(:class, 'program').text.gsub(/[\r\n]/, '')
      instructor = element.find_element(:class, 'instractor').text.gsub(/[\r\n]/, '')

      if !time || !program
        next
      end
      result << Lesson.new(time, program, instructor)
    end
    result
  end
end