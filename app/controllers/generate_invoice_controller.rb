class GenerateInvoiceController < ApplicationController
skip_before_action :verify_authenticity_token
  def customerName
    customerName = Customer.all
    render json: customerName
  end

  def getItems
    getItems = Item.all
    render json: getItems
  end

end
