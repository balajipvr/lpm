class AddUnitqtytoitems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :unit_qty, :int
  end
end
