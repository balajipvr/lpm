class ChangeOrdertablecolumnname < ActiveRecord::Migration[5.1]
  def change
  rename_column :orders, :customer_email, :customer_name
  end
end
