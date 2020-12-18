class GenerateInvoiceController < ApplicationController

  def customerName
    customerName = Customer.all
    render json: customerName
  end

  def getItems
    getItems = Item.all
    render json: getItems
  end

end
