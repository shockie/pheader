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
import "regenerator-runtime/runtime";
import Vue from 'vue'
import Buefy from 'buefy'

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
//
import Base from 'components/layouts/Base'
import router from './router'
import store from './store'

Vue.use(Buefy)

new Vue({
  el: '#app',
  router,
  store,
  components: {
    Base
  },
  render: (h) => h('Base')
})
