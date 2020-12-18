class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.string :order_id
      t.string :item_name
      t.numeric :qty
      t.numeric :unit_price
      t.timestamps
    end
  end
end
