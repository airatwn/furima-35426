class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|

      t.string     :portal_code
      t.integer    :prefecture_id
      t.string     :address1
      t.string     :address2
      t.string     :building_name
      t.string     :phone_number
      t.references :order
      t.timestamps
    end
  end
end
