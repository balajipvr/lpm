ActiveAdmin.register Customer do
  permit_params :company_name, :address, :mobilenumber, :gstnumber, :city, :pincode, :email, :name
  actions :index,:create,:edit,:update,:new, :destroy
end
