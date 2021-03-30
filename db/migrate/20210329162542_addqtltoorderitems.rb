class Addqtltoorderitems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :item_qtl_number, :int
    add_column :order_items, :item_qtl_decimal, :int
  end
end
