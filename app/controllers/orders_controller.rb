class OrdersController < ApplicationController
  before_action :set_item
  def index
    
    @order_address = OrderAddress.new

  end

  def create
    @order_address = OrderAddress.new(order_params.merge(item_id: @item.id))
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :cities, :house_number, :building, :tell).merge(user_id: current_user.id)
  end


end
