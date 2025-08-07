require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it "nameとdescriptionとcategory_idとquality_idとpostage_idとprefecture_idとshipping_day_idとpriceとimageが存在すれば登録できる" do
        
      end
    end
    context '出品できない場合' do
      it "nameが空では登録できない" do
        
      end
      it "nameが40文字を超えていたら登録できない" do

      end
      it "descriptionが空では登録できない" do

      end
      it "descriptionが1000文字を超えていたら登録できない" do

      end
      it "category_idが空では登録できない" do

      end
      it "quality_idが空では登録できない" do

      end
      it "postage_idが空では登録できない" do

      end
      it "prefecture_idが空では登録できない" do

      end
      it "shipping_day_idが空では登録できない" do

      end
      it "priceが空では登録できない" do

      end
      it "priceが半角数字でなかったら登録できない" do

      end
      it "priceが300円未満では登録できない" do

      end
      it "priceが9_999_999円を超えていたら登録できない" do

      end
      it "imageが空では登録できない" do

      end
    end
  end
end
