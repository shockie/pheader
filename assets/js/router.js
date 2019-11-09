import Feed from 'components/Feed'
import Login from 'components/Login'
import VueRouter from 'vue-router'
import Vue from 'vue'
import store from './store'

const routes = [
  { path: '/', component: Feed, name: 'root', meta: { requiresAuth: true } },
  { path: '/login', component: Login, name: 'login' }
]

Vue.use(VueRouter)

const router = new VueRouter({
  routes,
})

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth)) {
    if (store.getters.loggedIn) {
      next()
    } else {
      next({
        name: 'login',
        query: {
          redirect: to.fullPath
        }
      })
    }
  } else {
    next()
  }
})

export default router
