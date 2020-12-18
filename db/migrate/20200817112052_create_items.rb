class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.numeric :unit_price
      t.string :description
      t.timestamps
    end
  end
end
