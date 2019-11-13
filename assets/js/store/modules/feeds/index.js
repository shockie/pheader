import { create } from 'services/feed'

export default {
  namespaced: true,
  state: {
    feeds: []
  },
  getters: {
    hasFeeds(state) {
      return state.feeds.length > 0
    }
  },
  mutations: {
    addFeed(state, feed) {
      state.feeds.push(feed)
    }
  },
  actions: {
    async addFeed({ commit }, params) {
      const data = await create(params)

      commit('addFeed', data)

      return data
    }
  }
}
