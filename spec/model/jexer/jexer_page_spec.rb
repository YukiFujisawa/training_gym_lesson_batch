require 'spec_helper'
require 'model/jexer/jexer_page'
require 'model/jexer/jexer_shops'

RSpec.describe JexerPage do
  let!(:driver) { TrainingGymLessonBatch.get_driver }
  let(:page_object) { JexerPage.new(driver) }

  describe '#BASE_URL' do
    it 'ページに遷移できること' do
      driver.navigate.to(JexerPage::BASE_URL)
      expect(driver.title).to eq 'ジェクサー・フィットネス＆スパ 新宿【グループエクササイズタイムスケジュール】'
    end
  end


  describe '#shop_select' do
    JexerShops::LIST.each do |shop|
      context "#{shop.shop_name}店を表示した場合" do
        it do
          page_object.go_shop_page(shop)
          expect(driver.title).to match /#{shop.shop_name}【グループエクササイズタイムスケジュール】/
        end
      end

    end
  end
end