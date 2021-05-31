import HTTP from './http-common'

export default {
  createOrder: function(orderdetail) {
  return HTTP.post('/order', orderdetail)
},
 loadOrder: function(orderID){
  return HTTP.get('/order/' + orderID)
},
 updateOrder: function(orderdetail, orderID) {
  return HTTP.put('/order/'+ orderID, orderdetail)

 }
}
