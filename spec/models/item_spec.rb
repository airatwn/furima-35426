require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品登録できるとき' do
     it 'imageとitem_nameとitem_text、category_idとcondition_idとshipping_charge_idとprefecture_idとdays_to_ship_idが存在すれば登録できる' do
      expect(@item).to be_valid
     end
    end
  end
    context '商品出品登録できないとき' do
     it '商品画像を1枚ないと登録できない' do
       @item.image = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Nickname can't be blank")
     end
    it '商品名が空では登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
    end
    it '商品説明が空では登録できない' do
      @item.item_text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'カテゴリー情報が空では登録できない' do
      @item.category = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
    end
    it '商品の状態の情報が空では登録できない' do
      @item.condition = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
    end
    it '配送料負担の情報が空では登録できない' do
      @item.shipping_charge = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
    end
    it '配送元の地域の情報が空では登録できない' do
      @item.prefecture = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
    end
    it '発送までの日数情報が空では登録できない' do
      @item.days_to_ship = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
    end
    it '販売価格情報が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
    end
    it '販売価格が300円〜9,999,999円の枠からはみ出ると登録できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
    end
    it '販売価格が半角数字以外は登録できない' do
      @item.price = '千円'
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
    end

 
