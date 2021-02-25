class OrderController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    new_order_params = permit_params
    new_order_params[:order_items_attributes] = new_order_params.delete(:order_items)
    pp new_order_params
    Order.create!(new_order_params)
    invoicenumber = Order.last
    render json: {:invoice_num => invoicenumber.invoice_number,:status => "success"}
  end

  private

  def permit_params
    params.require(:order_detail).permit(:customer_id,:logisitcs,:order_total,:vehicle,
    :customer_email, :customer_mobilenumber, order_items: [ :item_name,:item_qty,:item_price,
      :item_unit_qty,:unit_price])
    end

  end
