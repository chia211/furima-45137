require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before(:all) do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id,item_id: item.id)
  end
  describe '購入情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'postal_codeが半角文字列の3桁-4桁でないと保存できないこと' do
        @order_address.post_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'postal_codeがハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_code = '12345'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture を選択してください")
      end
      it 'citiesが空だと保存できないこと' do
        @order_address.cities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Cities can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'tellが空だと保存できないこと' do
        @order_address.tell = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell can't be blank")
      end
      it 'tellが9桁以下の半角の時は保存できないこと' do
        @order_address.tell = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell is invalid")
      end
      it 'tellが12桁以上の半角数値の場合は保存できないこと' do
        @order_address.tell = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell is invalid")
      end
      it 'tellが全角数値だと保存できないこと' do
        @order_address.tell = '１２３４５６７８９０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell is invalid")
      end
      it 'tellが半角数値以外が含まれると保存できないこと' do
        @order_address.tell = '123-4567-8901'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end


