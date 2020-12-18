class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :customer_id
      t.string :email
      t.string :mobilenumber
      t.timestamps
    end
  end
end
