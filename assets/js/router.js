import Feed from 'components/Feed'
import Feeds from 'views/Feeds'
import Login from 'components/Login'
import VueRouter from 'vue-router'
import Vue from 'vue'
import store from './store'

const authenticated = [
  { path: '/', component: Feed, name: 'root' },
  { path: '/feeds/new', component: Feeds.New, name: 'newFeed' }
].map((route) => { 
  return {
    meta: {
      requiresAuth: true,
      ...route.meta
    },
    ...route
  }
})

const routes = [
  { path: '/login', component: Login, name: 'login' },
].concat(authenticated)

Vue.use(VueRouter)

const router = new VueRouter({
  routes,
})

router.beforeEach(async (to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth)) {
    if (await store.dispatch('loggedIn')) {
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
