class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :image
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999},
    format: { with: /\A[0-9]+\z]/, message: "は半角数字のみで入力してください" }
  end
  with_options numericality: { other_than: 1, message: "を選択してください" } do
    validates :category_id
    validates :quality_id
    validates :shipping_day_id
    validates :prefecture_id
    validates :postage_id
  end
end
