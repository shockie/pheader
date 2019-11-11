export default {
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
  }
}
