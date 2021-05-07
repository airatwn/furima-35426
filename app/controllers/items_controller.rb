class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :authenticate_user!, only:[:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

   private
  
    def item_params
      params.require(:item).permit(:image, :item_name, :category_id, :price, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :item_text).merge(user_id: current_user.id)
    end

    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end
end
