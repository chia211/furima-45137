require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'email、passwordとpassword_confirmationが存在すれば登録できる' do
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do

      end
      it 'emailが空では登録できない' do

      end
      it 'emailが一意性でないと登録できない' do

      end
      it 'emailは@を含まないと登録できない' do

      end
      it 'passwordが空では登録できない' do

      end
      it 'passwordが5文字以下では登録できない' do

      end
      it 'passwordは半角英数字混合での入力でないと登録できない' do

      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do

      end
    end
  end
end
