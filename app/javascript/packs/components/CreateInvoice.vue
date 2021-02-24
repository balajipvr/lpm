<template lang="html">
  <div>
    <div id="printMe">
      <div id="page-wrap">
        <div class="header">
          <img src="../images/lpm.png" class="img">
          <h1>L.PADMANABAN</h1><br>
          <h1>SELVAMBAL MODERN RICE MILL</h1>
          <p> 1/279,Chetpet Road,Arani-632301</p>
          <h2>Invoice</h2>
        </div>
        <div class="usermain">
          <div id="identity">
            <table class="usertable">
              <thead>
                <th>BILL FROM</th>
                <th></th>
              </thead>
              <tr class="user-row">
                <td><label for="Name">Name:</label></td>
                <td><input type="text" id="Name" :value="orderdetail.company_name" readonly class="usercontent"></td>
              </tr>
              <tr class="user-row">
                <td><label for="Address">Address:</label></td>
                <td><input type="text" id="Address"  :value="orderdetail.company_address" readonly class="usercontent"></td>
              </tr>
              <tr class="user-row">
                <td><label for="City">City:</label></td>
                <td><input type="text" id="City"  :value="orderdetail.company_city" readonly class="usercontent"></td>
              </tr>
              <tr class="user-row">
                <td><label for="Phone">Phone:</label></td>
                <td><input type="text" id="Phone" :value="orderdetail.company_phone" readonly class="usercontent"></td>
              </tr>
              <tr class="user-row">
                <td><label for="GST">Gst-Number:</label></td>
                <td><input type="text" id="gst" :value="orderdetail.company_gst" readonly class="usercontent"></td>
              </tr>
            </table>
          </div>
          <div>
            <table class="invoicenumber">
              <thead>
                <th>Invoice-Num</th>
                <th>Date</th>
              </thead>
              <tr class="invoice-row">
                <td>0002</td>
                <td><datepicker v-model="date" class="date"></datepicker></td>
              </tr>
            </table>
          </div>
        </div>
        <div style="clear:both"></div>
        <div id="customer">
          <table class="usertable">
            <thead>
              <th>BILL TO</th>
              <th></th>
            </thead>
            <tr class="user-row">
              <td><label for="Name">Name:</label></td>
              <td><select class="custom-select" name="selectCustomer" v-on:change="loadCustomerDetails()" v-model="company_details">
                <option v-for="customerName in customerNames" :value="customerName">
                  {{ customerName.company_name }}
                </option>
              </select></td>
            </tr>
            <tr class="user-row">
              <td><label for="CompanyAddress">Address:</label></td>
              <td><input type="text" id="CompanyAddress" name="CompanyAddress" :value="this.company_details.address" readonly class="usercontent"></td>
            </tr>
            <tr class="user-row">
              <td><label for="CompanyCity">City:</label></td>
              <td><input type="text" id="CompanyCity" name="CompanyCity" :value="this.company_details.city" readonly class="usercontent"></td>
            </tr>
            <tr class="user-row">
              <td><label for="CompanyPincode">Pincode:</label></td>
              <td><input type="text" id="CompanyPincode" name="CompanyPincode" :value="this.company_details.pincode" readonly class="usercontent"></td>
            </tr>
            <tr class="user-row">
              <td><label for="CompanyPhone">Phone:</label></td>
              <td><input type="text" id="CompanyPhone" name="CompanyPhone" :value="this.company_details.mobilenumber" readonly class="usercontent"></td>
            </tr>
            <tr class="user-row">
              <td><label for="CompanyGST">Gst-Number:</label></td>
              <td><input type="text" id="CompanyGST" name="CompanyGST" :value="this.company_details.gstnumber" readonly class="usercontent"></td>
            </tr>
          </table>
        </div>
        <div class="vehicle">
          <table class="invoicenumber">
            <thead>

            </thead>
            <tr class="invoice-row">
              <td>Vehicle-Number</td>
              <td><input type="text" class="unitcost" v-model="orderdetail.vehicle" style="border:none"></td>
            </tr>
          </table>
        </div>
        <table width="100%" class="invoicetable">
          <thead>
            <th>S.No</th>
            <th>Description</th>
            <th>UnitWeight</th>
            <th>Quantity</th>
            <th colspan="2">QTL</th>
            <th>Unit Cost</th>
            <th>Price</th>
          </thead>
          <tr class="item-row" v-for="(item, index) in itemspecs">
            <td class="Sno"><div class="delete-wpr">{{ index + 1 }}<a class="delete" v-on:click="deleteItem(index)"   title="Remove row">X</a></div></td>
            <td class="description"><select v-model="item.item_name">
              <option v-for="itemName in itemNames">
                {{ itemName }}
              </option>
            </select></td>
            <td class="quantity"><select class="custom-select" name="selectItem" v-model="item.item_unit_qty">
              <option v-for="unit_qty in itemUnitQty" >
                {{ unit_qty }}
              </option>
            </select></td>
            <td class="quantity"><input type="text" class="unitcost" v-model="item.item_qty" style="border:none"></td>
            <td class="qtl"><input type="text" class="unitcost" v-model="item.item_qtl_number" v-on:click="qtlcalc"  style="border:none"></td>
            <td class="qtl"><input type="text" class="unitcost" v-model="item.item_qtl_decimal"  style="border:none"></td>
            <td class="price"><input type="text" class="unitcost"  v-model="item.unit_price" style="border:none"></td>
            <td class="cost"><span>{{item.unit_price * item.item_qty}}</span></td>
          </tr>
        </table>
        <table id="items">
          <tr class="hiderow">
            <td colspan="5"><a id="addrow" v-on:click="addNewItem" title="Add a row">Add a row</a></td>
          </tr>
          <tr>
            <td colspan="2" class="blank"> </td>
            <td colspan="2" class="total-line balance">Subtotal</td>
            <td class="total-value balance"><div id="subtotal">{{ subTotal }}</div></td>
          </tr>
          <tr>
            <td colspan="2" class="blank"> </td>
            <td colspan="2" class="total-line balance">Logistics</td>
            <td class="total-value balance"><input type="text" class="logistics" v-model="logistics" style="border:none"></td>
          </tr>
          <tr>
            <td colspan="2" class="AmounttoWords"><p>Amount in Words:</p>{{amountInWords}} Rupees Only</td>
            <td colspan="2" class="total-line balance">Total</td>
            <td class="total-value balance"><input type="text" class="logistics" v-model="total" style="border:none"></td>
          </tr>
        </table>
        <div id="terms">
          <table class="usertable">
            <thead>
              <th>Company's Bank Details</th>
              <th></th>
            </thead>
            <tr class="user-row">
              <td><label for="Bank Name">Bank Name:</label></td>
              <td><input type="text" id="Bank Name" name="Bank Name" value="Canara Bank,Arani" readonly class="usercontent"></td>
            </tr>
            <tr class="user-row">
              <td><label for="A/C Name">A/C Name:</label></td>
              <td><input type="text" id="A/C Name" name="A/C Name" value="Selvambal Modern Rice Mill" readonly class="usercontent"></td>
            </tr>
            <tr class="user-row">
              <td><label for="A/C NO">A/C NO:</label></td>
              <td><input type="text" id="A/C NO" name="A/C NO" value="0949261005123" readonly class="usercontent"></td>
            </tr>
            <tr class="user-row">
              <td><label for="IFSC">Bank IFSC Code:</label></td>
              <td><input type="text" id="IFSC" name="IFSC" value="CNRB0000949" readonly class="usercontent"></td>
            </tr>
          </table>
        </div>
        <div class="footer">
          <p>Thank You !</p>
          <p class="sign">For Selvambal Modern Rice Mill</p><p class="BuyersSign">Buyer's Signature</p><br>
          <br>
          <p class="sign">Authorised Signatory</p><br>

        </div>
      </div>
    </div>
    <button v-print="'#printMe'" v-on:click="createOrder()">Print</button>
  </div>
</template>

<script>
import CustomerDetailService from '../service/CustomerDetailService.js';
import ItemDetailService from '../service/ItemDetailService.js';
import CreateOrderService from '../service/CreateOrderService.js'
import OrderDetail from '../models/OrderDetail.js';
import Datepicker from 'vuejs-datepicker';
import _ from 'lodash';
import Vue from 'vue';
export default {
  name: 'CreateInvoice',
  data : function() {
    return {
      orderdetail : new OrderDetail(),
      customerNames: [],
      itemspecs: [],
      company_details: [],
      itemDetails: [],
      itemQty: [],
      itemNames: [],
      itemUnitQty: [],
      logistics: 0,
      date: new Date()
    }
  },
  components: {
    Datepicker
  },

  computed: {
    subTotal: function() {
      var subtotal = this.itemspecs.reduce(function(accumulator, item) {
        return accumulator + (item.unit_price * item.item_qty);
      }, 0)
      return subtotal;
    },

    total: function() {
      return parseInt(this.subTotal) - parseInt(this.logistics);
    },
    amountInWords: function () {
      var converter = require('number-to-words');
      var words = converter.toWords(this.total);
      return words;
    }
  },

  methods: {
    loadCustomerName: function() {
      return CustomerDetailService.customerName().then(resp => {
        this.customerNames = resp.data;
      })
    },

    loadCustomerDetails: function() {},

    loadItems: function() {
      return ItemDetailService.itemDetail().then(
        resp => {
          this.itemDetails = this.orderdetail.getItemdetail(resp.data);
          this.itemspecs = this.orderdetail.order_items;
          this.itemNames = this.orderdetail.itemName;
          this.itemUnitQty = this.orderdetail.unitqty;
        }
      )
    },

    loadItemQty: function() {
    },

    addNewItem: function() {

      this.itemspecs.push(
        {
          item_name: "",
          item_qty: 0,
          unit_price: 0,
          item_qtl_number: 0,
          item_qtl_decimal: 0,
          item_unit_qty: 0
        }
      )
    },
    deleteItem: function(index) {
      this.itemspecs.splice(index, 1)
    },

    qtlcalc: function() {

      _.each(this.itemspecs, function (item) {

        let  qtl = ((item.item_qty * item.item_unit_qty)/100).toFixed(2);
        item.item_qtl_number = Math.trunc(qtl);
        item.item_qtl_decimal = (qtl - Math.floor(qtl)).toFixed(2);
      })

    },

    createOrder: function() {
      this.orderdetail.customer_id = this.company_details.id;
      this.orderdetail.customer_email = this.company_details.company_name;
      this.orderdetail.customer_mobilenumber = this.company_details.mobilenumber;
      this.orderdetail.logisitcs = this.logistics;
      this.orderdetail.order_total = this.total;
      console.log(this.orderdetail);
      CreateOrderService.createOrder({
      order_detail: this.orderdetail
}
)

    },

  },
  mounted() {
    this.loadCustomerName();
    this.loadItems();
  }
}

</script>

<style scoped>

@import '../assets/invoice.css';

@page {
  margin: 18px;
}
</style>
