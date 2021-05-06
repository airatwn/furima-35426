class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :category_id
      t.integer :price
      t.integer :condition_id
      t.integer :shipping_charge_id
      t.integer :prefecture_id
      t.integer :days_to_ship_id
      t.text :item_text
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
