class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_root_path
  before_action :redirect_if_seller, only: [:index, :create]
  
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new

  end


  def create
    @order_address = OrderAddress.new(order_params.merge(item_id: @item.id))
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    if @item.order.present? && @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def redirect_if_seller
  if @item.user_id == current_user.id 
    redirect_to root_path
  end
end

  def order_params
    params.require(:order_address)
    .permit(:post_code, :prefecture_id, :cities, :house_number, :building, :tell)
    .merge(user_id: current_user.id).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
