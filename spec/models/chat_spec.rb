require 'rails_helper'

RSpec.describe Chat, type: :model do
  before do
    @chat = FactoryBot.build(:chat)
  end
  describe '新規投稿' do
    it 'area_idが空では登録できない' do
      @chat.area_id = ''
      @chat.valid?
      expect(@chat.errors.full_messages).to include "地域を入力してください", "地域を選んで下さい"
    end

    it 'price_idが空では登録できない' do
      @chat.price_id = ''
      @chat.valid?
      expect(@chat.errors.full_messages).to include "価格を入力してください", "価格を選んで下さい"
    end

    it 'sauna_temperature_idが空では登録できない' do
      @chat.sauna_temperature_id = ''
      @chat.valid?
      expect(@chat.errors.full_messages).to include "サウナの温度を入力してください", "サウナの温度を選んで下さい"
    end

    it 'water_bath_idが空では登録できない' do
      @chat.water_bath_id = ''
      @chat.valid?
      expect(@chat.errors.full_messages).to include "水風呂温度を入力してください", "水風呂温度を選んで下さい"
    end

    it 'sauna_nameが空では登録できない' do
      @chat.sauna_name = ''
      @chat.valid?
      expect(@chat.errors.full_messages).to include  "施設名を入力してください"
    end

    it 'descriptionが空では登録できない' do
      @chat.description = ''
      @chat.valid?
      expect(@chat.errors.full_messages).to include "感想を入力してください"
    end
  end
end
