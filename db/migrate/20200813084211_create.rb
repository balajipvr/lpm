class Create < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :mobilenumber
      t.string :gstnumber
      t.string :city
      t.string :pincode
      t.string :password_digest
      t.timestamps
    end
  end
end
