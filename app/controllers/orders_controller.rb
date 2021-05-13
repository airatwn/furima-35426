class OrdersController < ApplicationController
  def index
    @order = OrderShippingAddressecor.new #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderShippingAddressecor.new(order_params)
    if @order.valid?
       @order.save
       redirect_to root_path
    else
       render :new
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:portal_code, :prefecture_id, :address1, :address2, :phone_number).merge(:user_id, current_user.id)
  end
  #requireは引数にしていたorderのkeyだけを取得できる。permitaは許可したいパラメータをフィルタしてくれる。
  #mergeは追加したいカラム名 :値
  end

