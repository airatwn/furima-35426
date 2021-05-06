class CreateItemNames < ActiveRecord::Migration[6.0]
  def change
    create_table :item_names do |t|

      t.timestamps
    end
  end
end
