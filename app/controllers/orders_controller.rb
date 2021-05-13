class OrdersController < ApplicationController
  def index
    @order_shipping_address = OrderShippingAddress.new #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
       @order_shipping_address.save
       redirect_to root_path
    else
       render :index
    end
  end
  
  private

  def order_params
    params.require(:order_shipping_address).permit(:portal_code, :prefecture_id, :address1, :address2, :building_name, :phone_number,).merge(user_id: current_user.id)
  end
  #requireは引数にしていたorderのkeyだけを取得できる。permitaは許可したいパラメータをフィルタしてくれる。
  #mergeは追加したいカラム名 :値
  end

