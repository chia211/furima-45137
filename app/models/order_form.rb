class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :price, :address, :payment_method

  validates :user_id, :item_id, :price, :address, :payment_method, presence: true
  validates :price, numericality: { greater_than: 0 }

  def save
    return false unless valid?  # バリデーションチェック

    ActiveRecord::Base.transaction do
      order = Order.create!(user_id: user_id, item_id: item_id, price: price)
      Address.create!(order_id: order.id, address: address)
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end
end