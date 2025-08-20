class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options numericality: { other_than: 1, message: "を選択してください" } do
    validates :prefecture_id
  end


  with_options presence: true do
    validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :cities
    validates :house_number
    validates :tell
  end
end
