class Addrelationbetweenorderandcustomer < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :customers, index: true
  end
end
