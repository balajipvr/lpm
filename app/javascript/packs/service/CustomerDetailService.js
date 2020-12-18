import HTTP from './http-common'

export default {
  customerName: function() {
  return HTTP.get('/generate_invoice/customerName')
}
}
