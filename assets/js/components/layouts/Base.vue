<template lang="pug">
  div
    b-navbar(shadow)
      template(slot="brand")
        b-navbar-item(tag="router-link" :to="{ path: '/' }") Pheader
      template(slot="end")
        b-navbar-dropdown(
          v-if="loggedIn"
          :label="currentUser.email"
        )
          b-navbar-item(
            @click="logout"
          ) Logout
        b-navbar-item(
          v-else
          tag="div"
        )
          router-link(:to="{ name: 'login' }" class="button") Login
    router-view
</template>

<script>
import { mapGetters, mapState } from 'vuex'
export default {
  name: 'BaseLayout',
  computed: {
    ...mapGetters([
      'loggedIn',
      'currentUser'
    ])
  },
  methods: {
    ...mapState([
      'clearToken'
    ]),
    logout() {
      this.clearToken()
      this.$router.push({
        name: 'login'
      })
    }
  }
}
</script>
