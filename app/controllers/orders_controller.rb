class OrdersController < ApplicationController
  def index
    @order_shipping_address = OrderShippingAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      pay_item
       @order_shipping_address.save
       redirect_to root_path
    else
       render :index
    end
  end
  
  private

  def order_params
    params.require(:order_shipping_address).permit(:portal_code, :prefecture_id, :address1, :address2, :building_name, :phone_number, :price).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_b5b47ec62de76b35daf656bb"
    Payjp::Charge.create(
      amount: @item.price,
      card:   order_params[:token],
      currency: 'jpy'
    )
  end
  end

