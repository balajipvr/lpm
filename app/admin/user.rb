ActiveAdmin.register User do
  permit_params :username, :email, :mobilenumber, :gstnumber, :city, :pincode, :password_digest
  actions :index,:create,:edit,:update,:new, :delete
end
