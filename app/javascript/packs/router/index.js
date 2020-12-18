import Vue from 'vue'
import Router from 'vue-router'
import CreateInvoice from '../components/CreateInvoice.vue';

Vue.use(Router);

const router = new Router({
    mode: 'history',
    routes: [

        {
            path: '/generate_invoice',
            name: 'CreateInvoice',
            component: CreateInvoice
        }
    ]
})

// router.beforeEach((to, from, next) => {
//     const user = store.getters.user
//     if (to.matched.some(record => record.meta.requiresAuth)) {
//         if (user) {
//             next()
//         } else {
//             next({ name: 'signin-page', query: { redirect: to.fullPath } })
//         }
//     } else {
//         next()
//     }
// })

export default router
