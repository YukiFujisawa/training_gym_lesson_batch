require 'spec_helper'
require 'model/page/jexer_page'

RSpec.describe JexerPage do
  let!(:driver) { TrainingGymLessonBatch.get_driver }
  let(:page_object) { JexerPage.new(driver.browser) }

  describe '共通' do
    it 'ページに遷移できること' do
      driver.navigate.to(JexerPage::BASE_URL)
      expect(driver.title).to eq 'ジェクサー・フィットネス＆スパ 新宿【グループエクササイズタイムスケジュール】'
    end
  end

end