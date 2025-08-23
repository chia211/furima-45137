require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id)
  end
  describe '購入情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
      it 'buildingは空でも保存できること' do
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'prefecture_idを選択していないと保存できないこと' do
      end
      it 'citiesが空だと保存できないこと' do
      end
      it 'house_numberが空だと保存できないこと' do
      end
      it 'tellが空だと保存できないこと' do
      end
      it 'tellが10桁以上11桁以内の半角数値でないと保存できないこと' do
      end
      it 'userが紐付いていないと保存できないこと' do
      end
    end
  end
end


