require 'training_gym_lesson_batch'
require 'model/page/jexer_page'
require 'model/jexer_shops'

driver = TrainingGymLessonBatch.get_driver
driver.navigate.to JexerPage::BASE_URL
driver.save_screenshot 'text.png'

page = JexerPage.new(driver)

JexerShops::LIST.each do |shop|
  page.go_shop_page(shop)
  page.all_lessons(shop).each do |lesson|
    puts lesson.to_csv
  end
end
