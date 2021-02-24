import HTTP from './http-common'

export default {
  createOrder: function(orderdetail) {
  return HTTP.post('/order', orderdetail)
}
}
