import Vue from 'vue';
import VModal from 'vue-js-modal';
import router from './router';
import ClientApp from './components/ClientApp.vue';
import Datepicker from 'vuejs-datepicker';
import Print from 'vue-print-nb';


document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('client_app'))

  Vue.use(VModal, {
    dialog: true
  });
  Vue.use(Print);
  const app = new Vue({router, template: "<ClientApp></ClientApp>", components: {ClientApp}}).$mount('client_app')
})
