class ChangeColumnNameforOrderItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :order_items, :qty, :item_qty
    add_column :order_items, :item_unit_qty, :int
    add_column :order_items, :item_price, :int
  end
end
