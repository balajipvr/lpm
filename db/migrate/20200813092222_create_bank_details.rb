class CreateBankDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_details do |t|
      t.string :bank_name, :null => false
      t.string :account_name, :null => false
      t.bigint :account_number, :null => false
      t.string :ifsc_code
    end
  end
end
