class AddForeignKeyContraintoOrderandOrderitems < ActiveRecord::Migration[5.1]
  def change
    add_reference(:order_items, :orders, foreign_key: true)
  end
end
