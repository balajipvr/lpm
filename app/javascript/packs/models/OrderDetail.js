import _ from "lodash";

function OrderDetail() {
 this.company_name = "Selvambal Modern Rice Mill";
 this.company_address = "1/279,Chetpet Road Arani";
 this.company_city = "Tiruvannamalai,632301";
 this.company_phone = "94443308913";
 this.company_gst = "33AIGPP8701R2Z0";
 this.customer_id = [];
 this.itemName = [];
 this.unitqty = [];
 // this.item_name = [];
 // this.item_qty = [];
}

OrderDetail.prototype.getItemdetail = function(items) {
this.itemName = _.map(items,'item_name');
this.unitqty = _.map(items,'unit_qty');
this.itemdata = [
{
  item_name: "",
  item_qty: 0,
  item_price: 0,
  item_qtl: 0,
  item_unit_qty: 0
}
]


}
export default OrderDetail;
