class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture, :cities, :house_number, :building, :tell

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  # with_options presence: true do
  #   validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #   validates :cities
  #   validates :house_number
  #   validates :tell
  #   validates :user_id
  # end

  
end