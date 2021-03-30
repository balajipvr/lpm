import _ from "lodash";

function CreateOrder() {

  this.customerName = "";
  this.customer_email = "";
  this.customer_mobilenumber = "";
  this.vehicleNumber = "";
  this.customer_id = 0;
  this.logisitcs = 0;
  this.subtotal = 0;
  this.total = 0;
  this.item_details = [
    {
      item_name: "",
      item_qty: 0,
      unit_price: 0,
      item_qtl_number: 0,
      item_qtl_decimal: 0,
      item_unit_qty: 0
    }
  ]
}

export default CreateOrder;
