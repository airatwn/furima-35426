class OrderShippingAddress
    include ActiveModel::Model
    attr_accessor :portal_code, :prefecture_id, :address1, :address2, :building_name, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :portal_code,  format: { with: /\A\d{3}[-]\d{4}\z/ } #ハイフンあり7桁 xxx-xxxx
    validates :prefecture_id,   numericality: { other_than: 1 }
    validates :address1
    validates :address2
    validates :phone_number, format: { with: /\A\d[0-9]{,11}\z/ } #ハイフンなし11桁以内の数字のみ
    validates :user_id
    validates :token,        format: { with: /[a-zA-Z0-9]+/ } #半角英数字
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id) 
    ShippingAddress.create(portal_code: portal_code, prefecture_id: prefecture_id, address1: address1, address2: address2, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end