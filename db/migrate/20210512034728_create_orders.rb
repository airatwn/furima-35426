class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.references :user_id
      t.references :order_id
      t.timestamps
    end
  end
end
