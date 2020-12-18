class AddTimestampsBankDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :bank_details, :created_at, :datetime
    add_column :bank_details, :updated_at, :datetime
  end
end
