<template lang="html">
  <div>
    <table>
      <tr>
        <td><label for="Name" class="form-control">Customer Name:</label></td>
        <td><select class="form-control" name="selectCustomer" :disabled=isEdit v-on:change="getCustomerid()" v-model="createorder.customerName">
          <option v-for="customerName in customerNames">
            {{ customerName.name }}
          </option>
        </select></td>
      </tr>
      <tr>
        <td><label for="Name" class="form-control">Vehicle-Number:</label></td>
        <td><input type="text" class="form-control" style="width:120px" v-model="createorder.vehicle"></td>
      </tr>
      <tr>
        <td><label for="Name" class="form-control">Logistics:</label></td>
        <td><input type="text" class="form-control" style="width:70px" v-model="createorder.logisitcs"></td>
      </tr>
      <tr>
        <td><label for="Name" class="form-control">Sub-Total:</label></td>
        <td><input type="text" class="form-control" style="width:70px" v-model="subtotal"></td>
      </tr>
      <tr>
        <td><label for="Name" class="form-control">Total:</label></td>
        <td><input type="text" class="form-control" style="width:70px" v-model="total"></td>
      </tr>
    </table>
    <br><br></br></br>
    <table>
      <thead>
        <th></th>
        <th> ItemName </th>
        <th> UnitQty </th>
        <th> ItemQty </th>
        <th> UnitCost </th>
        <th colspan="2">QTL</th>
        <th> Price </th>
      </thead>
      <tr v-for="(items_detail, k) in createorder.order_items" :key="k">
        <td scope="row" class="trashIconContainer">
          <i class="far fa-trash-alt" v-on:click="deleteRow(k)"></i>
        </td>
        <td>
          <select class="form-control" name="selectCustomer" v-model="items_detail.item_name">
            <option v-for="itemName in items" >
              {{ itemName.item_name }}
            </option>
          </select>
        </td>
        <td>
          <select class="form-control" style="width:70px" name="selectCustomer" v-model="items_detail.item_unit_qty">
            <option v-for="unitQty in items" >
              {{ unitQty.unit_qty }}
            </option>
          </select>
        </td>
        <td>
          <input class="form-control" style="width:70px" v-model="items_detail.item_qty" />
        </td>
        <td>
          <input class="form-control" style="width:90px" v-model="items_detail.unit_price" />
        </td>
        <td style="width:70px">
          <input class="form-control" v-on:click="qtlcalc" v-model="items_detail.item_qtl_number" />
        </td>
        <td style="width:70px">
          <input class="form-control" v-model="items_detail.item_qtl_decimal" />
        </td>
        <td>
          <span class="form-control" style="width:90px">{{items_detail.unit_price * items_detail.item_qty}}</span>
        </td>
      </tr>
    </table>


    <button v-on:click="createOrder()" class="btn btn-primary">Submit</button>
    <button v-on:click="addNewItem()" class="btn btn-primary">Add Item</button>
  </div>
</template>
<script>
import CustomerDetailService from '../service/CustomerDetailService.js';
import CreateOrderService from '../service/CreateOrderService.js'
import ItemDetailService from '../service/ItemDetailService.js';
import CreateOrder from '../models/CreateOrder.js';
import Vue from 'vue';
import _ from 'lodash';
export default {
  name: 'NewInvoice',
  data : function() {
    return {
      createorder : new CreateOrder(),
      customerNames: [],
      items: [],
      isEdit: false
    }
  },
  computed: {

    subtotal: function() {
      var subtotal = this.createorder.order_items.reduce(function(accumulator, item) {
        return accumulator + (item.unit_price * item.item_qty);
      }, 0)
      return subtotal;

    },

    total: function() {
      return this.subtotal - this.createorder.logisitcs

    }

  },
  methods: {
    loadCustomerName: function() {
      return CustomerDetailService.customerName().then(resp => {
        this.customerNames = resp.data;
      })
    },
    loadItems: function() {

      return ItemDetailService.itemDetail().then(
        resp => {
          this.items = resp.data

        }
      )
    },
    addNewItem: function() {
      this.createorder.order_items.push(
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
    deleteRow: function(k) {
      this.createorder.order_items.splice(k, 1)
    },
    qtlcalc: function() {

      _.each(this.createorder.order_items, function (item) {

        let  qtl = ((item.item_qty * item.item_unit_qty)/100).toFixed(2);
        item.item_qtl_number = Math.trunc(qtl);
        item.item_qtl_decimal = (qtl - Math.floor(qtl)).toFixed(2);

      })

    },
    getCustomerid: function() {
      let cust_id;
      let cust_email;
      let cust_number;
      let selected_cust = this.createorder.customerName;
      let cust_details =  _.find(this.customerNames, function(getdetails)
      {
        if (getdetails.company_name == selected_cust)
        return getdetails
      })
      this.createorder.customer_id = cust_details.id;
      this.createorder.customer_name = cust_details.name;
      this.createorder.customer_mobilenumber = cust_details.mobilenumber;

    },
    createOrder: function() {
      this.createorder.subtotal = this.subtotal;
      this.createorder.total = this.total;

      if(!this.isEdit)
      {
        CreateOrderService.createOrder({order_detail: this.createorder}).then(resp => {
          if (resp.data.status == "success"){
            this.$alert("Order Created Succefully");
            Turbolinks.visit ('/admin/orders')
          };
        })
      }
      else
      {
        CreateOrderService.updateOrder({
          order_detail: this.createorder
        },this.createorder.id).then(resp => {
          if (resp.data.status == "success"){
            this.$alert("Order Updated Succefully");
            Turbolinks.visit ('/admin/orders')
          };
        })
      }
    },

    loadOrderdetails: function () {
      let params = (new URL(document.location)).searchParams;
      let order_id = params.get("id");
      if (!order_id) {
        return;
      }
      this.isEdit = true;
      CreateOrderService.loadOrder(order_id).then(resp => {
        this.createorder = new CreateOrder(resp.data);
      });

    }
  },
  mounted() {
    this.loadOrderdetails();
    this.loadCustomerName();
    this.loadItems();

  }
}
</script>

<style scoped>
</style>
