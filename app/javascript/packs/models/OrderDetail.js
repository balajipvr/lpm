import _ from "lodash";

function OrderDetail() {
 this.company_name = "Selvambal Modern Rice Mill";
 this.company_address = "1/279,Chetpet Road Arani";
 this.company_city = "Tiruvannamalai,632301";
 this.company_phone = "94443308913";
 this.company_gst = "33AIGPP8701R2Z0";
 this.customer_id = 0;
 this.customer_email = "";
 this.itemName = [];
 this.unitqty = [];
 this.logisitcs = 0;
 this.order_total = 0;
 this.customer_mobilenumber = "";
 this.vehicle = "";
}

OrderDetail.prototype.getItemdetail = function(items) {
this.itemName = _.map(items,'item_name');
this.unitqty = _.map(items,'unit_qty');
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

OrderDetail.prototype.invoiceDetails = function(invoice) {

 console.log(invoice);
 this.customer_id = invoice.customer_id;
 this.customer_name = invoice.customer_name;
 this.invoice_number = invoice.invoice_number;
 this.logisitcs = invoice.logisitcs;
 this.order_items = invoice.order_items;
 this.order_total = invoice.order_total;
 this.vehicle = invoice.vehicle;

}
export default OrderDetail;
