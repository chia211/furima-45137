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
  validates :name, :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 

end
