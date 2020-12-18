class AddLogisticsOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :logisitcs, :string
  end
end
