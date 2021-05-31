import _ from "lodash";

function CreateOrder(orderData) {
  console.log(orderData);
    _.extend(this, orderData);
  if(!this.customer_id)
 {
  this.customerName = "";
  this.customer_name ="";
  this.customer_mobilenumber = "";
  this.vehicle = "";
  this.customer_id = 0;
  this.logisitcs = 0;
  this.subtotal = 0;
  this.total = 0;
  this.order_items = [
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
  else
 {
  this.customerName = this.customer_name;
  this.customer_mobilenumber = this.customer_mobilenumber;
  this.vehicle = this.vehicle;
  this.customer_id = this.customer_id;
  this.logisitcs = this.logisitcs;
  this.subtotal = 0;
  this.total = 0;
  this.order_items = this.order_items
 }
}

export default CreateOrder;
