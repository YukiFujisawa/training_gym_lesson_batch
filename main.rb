require 'training_gym_lesson_batch'
require 'model/page/jexer_page'

driver = TrainingGymLessonBatch.get_driver
driver.navigate.to JexerPage::BASE_URL
driver.save_screenshot 'text.png'

page = JexerPage.new(driver)

page.lessons.each do |lesson|
  puts "新宿店,#{lesson.time},#{lesson.program},#{lesson.instructor}"
end

page.shop_select(32)


page.lessons.each do |lesson|
  puts "大塚店,#{lesson.time},#{lesson.program},#{lesson.instructor}"
end