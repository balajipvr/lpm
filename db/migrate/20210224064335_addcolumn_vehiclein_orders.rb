class AddcolumnVehicleinOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :vehicle, :string
  end
end
