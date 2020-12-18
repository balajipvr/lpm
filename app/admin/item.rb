ActiveAdmin.register Item do
  permit_params :item_name, :unit_price, :unit_qty, :description, :logistics 
  actions :index,:create,:edit,:update,:new, :destroy
end
