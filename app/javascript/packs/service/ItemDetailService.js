import HTTP from './http-common'

export default {
  itemDetail: function() {
  return HTTP.get('/generate_invoice/itemDetail')
}
}
