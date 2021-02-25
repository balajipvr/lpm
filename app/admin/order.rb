ActiveAdmin.register Order do
  permit_params :id, :customer_id, :customer_email, :customer_mobilenumber, :created_at, :logisitcs, :order_total, :invoice_number
  actions :index
end
