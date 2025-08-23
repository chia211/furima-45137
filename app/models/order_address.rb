class OrderAddress
  include ActiveModel::Model
  attr_accessor :token
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :cities, :house_number, :building, :tell

  with_options numericality: { other_than: 1, message: "を選択してください" } do
    validates :prefecture_id
  end

  with_options presence: true do
    validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :cities
    validates :house_number
    validates :tell, format: { with: /\A\d{10,11}\z/, message: "is invalid" }
    validates :user_id
    validates :item_id
    validates :token

  end

  def save
    return false unless valid?
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create!(
      post_code: post_code, 
      prefecture_id: prefecture_id, 
      cities: cities,
      house_number: house_number,
      building: building, 
      tell: tell, 
      order_id: order.id
      )
  end
  
end