class CreateItemTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :item_texts do |t|

      t.timestamps
    end
  end
end
