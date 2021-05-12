class OrderShippingAddress < ApplicationRecord
    include ActiveModel::Model
    attr_accesor :portal_code, :prefecture_id, :address1, :address2, :building_name, :phone_number, :order, :user_id
    end
    # ここにバリデーションの処理を書く
  with_options presence true do
    validates :portal_code,  format: { with: /\A\d{3}[-]\d{4}\z/ } #ハイフンあり7桁 xxx-xxxx
    validates :prefecture_id,   numericality: { other_than: 1 }
    validates :address1
    validates :address2
    validates :building_name
    validates :phone_number, format: { with: /\A\d[0-9]{,11}\z/ } #ハイフンなし11桁以内の数字のみ
    validates :order
    validates :user_id
  end
    def save
      # 各テーブルにデータを保存する処理を書く
      shipping_address.create(portal_code: portal_code, prefecture_id: prefecture, address1: address1, address2: address2, building_name: building_name, phone_number: phone_number)
    end
  end
  end
end
