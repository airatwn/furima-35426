class ItemController < ApplicationController

def create
  Item.create(item_params)
end


 private

  def item_params
    params.require(:item).permit(:image, :item_name, :category_id, :price, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :item_text).merge(user_id: current_user.id)
  end
end