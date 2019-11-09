import Vuex from 'vuex'
import Vue from 'vue'
import axios from 'axios'

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    user: {
      id: null,
      email: null,
      token: null
    }
  },
  getters: {
    loggedIn(state) {
      return state.user.token !== null
    },
    currentUser(state) {
      return state.user
    }
  },
  mutations: {
    setCurrentUser(state, user) {
      state.user = user
    },
    clearToken(state) {
      state.user = {
        id: null,
        email: null,
        token: null
      }
    }
  },
  actions: {
    async login({ commit }, { email, password }) {
      const response = await axios.post('/api/auth/token', {
        user: {
          email,
          password
        }
      })

      if (response.data && response.data.token) {
        commit('setCurrentUser', {
          email,
          password,
          token: response.data.token
        })
        return response.data.token
      }

      throw new Error('failed to get a token')
    }
  }
})

export default store
