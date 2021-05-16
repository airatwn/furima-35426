require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
    sleep 0.1 
  end

 describe '商品購入' do
  context '商品が購入できる時' do
    it '全項目が埋まっている時購入できる' do
      # binding.pry
      expect(@order_shipping_address).to be_valid
    end
    it '建物名が空でも商品が購入できる' do
      @order_shipping_address.building_name = ''
      expect(@order_shipping_address).to be_valid
    end
  end

  context '商品が購入できない時' do
    it 'クレジットカード情報が空の時購入できない' do
      @order_shipping_address.token = ''
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank", "Token is invalid")
    end
    it '郵便番号が空の時購入できない' do
      @order_shipping_address.portal_code = ''
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Portal code can't be blank", "Portal code is invalid")
    end
    it '郵便番号がハイフンが必要であること' do
      @order_shipping_address.portal_code = 6665555
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Portal code is invalid")
    end
    it '都道府県が空の時購入できない' do
      @order_shipping_address.prefecture_id = ''
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市町村が空の時購入できない' do
      @order_shipping_address.address1 = ''
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Address1 can't be blank")
    end
    it '番地が空の時購入できない' do
      @order_shipping_address.address2 = ''
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Address2 can't be blank")
    end
    it '電話番号が空の時購入できない' do
      @order_shipping_address.phone_number = ''
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end
    it '電話番号は11桁以内であること' do
      @order_shipping_address.phone_number = '111112222233333'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号は数値のみであること' do
      @order_shipping_address.phone_number = '080-12345678'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
 end
end
