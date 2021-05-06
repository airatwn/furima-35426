class ItemController < ApplicationController

def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
end

def new
  @item = Item.new
end

def index
end


 private

  def item_params
    params.require(:item).permit(:image, :item_name, :category_id, :price, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :item_text).merge(user_id: current_user.id)
  end
end