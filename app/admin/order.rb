ActiveAdmin.register Order do
  permit_params :id, :customer_id, :customer_email, :customer_mobilenumber, :created_at, :logisitcs, :order_total, :invoice_number
  actions :index

  index do
    column :id
    column :customer
    column :customer_email
    column :customer_mobilenumber
    column :logisitcs
    column :order_total
    column :vehicle
    column :invoice_number
    actions defaults: false do |order|
      link_to("generate invoice", generate_invoice_index_path(id:order.id))
    end
    actions defaults: false  do |order|
      link_to("Edit invoice", get_invoice_details_path(id:order.id))
    end
  end
end
