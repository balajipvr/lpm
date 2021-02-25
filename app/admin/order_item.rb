ActiveAdmin.register OrderItem do
  permit_params :order_id, :item_name, :item_qty, :unit_price, :item_unit_qty
  actions :index
end
