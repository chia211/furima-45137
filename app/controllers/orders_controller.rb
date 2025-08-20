class OrdersController < ApplicationController
  before_action :set_item
  def index
    
    @order = Order.new

  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def address_params
    params.require(:address).permit(:post_code, :prefecture_id, :cities, :house_number, :building, :tell).merge(order_id: @order.id)
  end
end
