class AddLogisticstoitems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :logistics, :int
  end
end
