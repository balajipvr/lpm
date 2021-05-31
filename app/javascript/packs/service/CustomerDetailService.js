import HTTP from './http-common'

export default {
  customerDetail: function() {
  return HTTP.get('/generate_invoice/customerName')
}
}
