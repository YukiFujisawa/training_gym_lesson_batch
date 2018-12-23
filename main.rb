require 'training_gym_lesson_batch'
require 'model/page/jexer_page'

driver = TrainingGymLessonBatch.get_driver
driver.navigate.to JexerPage::BASE_URL
driver.save_screenshot 'text.png'
