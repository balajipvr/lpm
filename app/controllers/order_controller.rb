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

  def show
    order_detail = Order.includes(:order_items).find(params[:id])
    render json: order_detail.to_json(:include => :order_items)
  end

  def update
    update_order_params = permit_params
    update_order_params[:order_items_attributes] = update_order_params.delete(:order_items)
    order = Order.find(params[:id])
    if order.update!(update_order_params)
      render json: {:status => "success"}
      else
        render json: {:status => order.errors}
      end
  end
  private

  def permit_params
    params.require(:order_detail).permit(:customer_id,:logisitcs,:order_total,:vehicle,
    :customer_name, :customer_mobilenumber, order_items: [ :item_name,:item_qty,:item_price,
      :item_unit_qty,:unit_price,:item_qtl_number,:item_qtl_decimal])
    end

  end
