ActiveAdmin.register BankDetail do
  permit_params :bank_name, :account_name, :account_number, :ifsc_code
  actions :index,:create,:edit,:update,:new, :destroy
end
