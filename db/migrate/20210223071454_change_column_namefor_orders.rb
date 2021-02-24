class ChangeColumnNameforOrders < ActiveRecord::Migration[5.1]
  def change
   rename_column :orders, :email, :customer_email
   rename_column :orders, :mobilenumber, :customer_mobilenumber
  end
end
