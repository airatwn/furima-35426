class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :prevention, only: [:index, :create]

  def index
    @order_shipping_address = OrderShippingAddress.new
  end
  
  def create
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
    params.require(:order_shipping_address).permit(:portal_code, :prefecture_id, :address1, :address2, :building_name, :phone_number ).merge(
      user_id: current_user.id, token: params[:token], item_id: params[:item_id]
    )
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def prevention
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

end
