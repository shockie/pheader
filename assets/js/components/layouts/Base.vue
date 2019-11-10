<template lang="pug">
  .base-layout-container
    b-navbar(shadow)
      template(slot="brand")
        b-navbar-item(tag="router-link" :to="{ path: '/' }") Pheader
      template(slot="end")
        b-navbar-dropdown(
          v-if="loggedIn"
          :label="currentUser.email"
          hoverable
          right
        )
          b-navbar-item(tag="div")
            | You're currently logged as
            strong {{ currentUser.email }}
          hr.dropdown-divider
          b-navbar-item(@click="logout") Logout
        b-navbar-item(
          v-else
          tag="div"
        )
          router-link(:to="{ name: 'login' }" class="button") Login
    .base-layout-content
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

<style lang="scss" scoped>
.base-layout-container {
  display: flex;
  flex-flow: column;
  min-height: 100vh;

  .base-layout-content {
    flex: 1;
  }
}
</style>
