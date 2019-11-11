import Vuex from 'vuex'
import Vue from 'vue'
import axios from 'axios'
import feeds from 'store/modules/feeds'
import { fetchCurrentUser } from 'services/user'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    feeds 
  },
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
    setToken(state, token) {
      state.user.token = token
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
    loggedIn({ commit, getters }) {
      const localToken = window.localStorage.getItem('token')
      if (getters.loggedIn) {
        return true
      } else if(localToken) {
        fetchCurrentUser().then((user) => {
          commit('setCurrentUser', {
            token: localToken,
            ...user
          })
        })
        return true
      }

      return false
    },
    async login({ commit }, { email, password, rememberMe }) {
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

        if(rememberMe) {
          window.localStorage.setItem('token', response.data.token)
        }
        return response.data.token
      }

      throw new Error('failed to get a token')
    }
  }
})

export default store
