// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
//
import Vue from 'vue'
import VueRouter from 'vue-router'
import Buefy from 'buefy'
import Base from 'components/layouts/Base'
import routes from './routes'

const router = new VueRouter({
  routes
})

Vue.use(Buefy)
Vue.use(VueRouter)

new Vue({
  el: '#app',
  router,
  components: {
    Base
  },
  render: (h) => h('Base')
})
