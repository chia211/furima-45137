class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)    
  end
  
  private

  def item_params
    params.require(:item).permit( :name, :description, :category_id, :quality_id,
    :postage_id, :prefecture_id, :shipping_day_id,
    :price, :image).merge(user_id: current_user.id)
  end
end
