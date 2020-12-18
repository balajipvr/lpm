class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :company_name, :null => false
      t.string :address
      t.string :email
      t.string :mobilenumber
      t.string :gstnumber
      t.string :city
      t.string :pincode
    end
  end
end
