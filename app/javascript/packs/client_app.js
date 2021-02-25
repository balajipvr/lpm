import Vue from 'vue';
import VModal from 'vue-js-modal';
import router from './router';
import ClientApp from './components/ClientApp.vue';
import Datepicker from 'vuejs-datepicker';
import VueSimpleAlert from "vue-simple-alert";
import Print from 'vue-print-nb';


document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('client_app'))
  Vue.use(VueSimpleAlert);
  Vue.use(Print);
  const app = new Vue({router, template: "<ClientApp></ClientApp>", components: {ClientApp}}).$mount('client_app')
})
