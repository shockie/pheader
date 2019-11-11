<template lang="pug">
  div
    div(v-if="hasFeeds")
    div(v-else)
      h1 Hello World
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  name: 'Feed',
  computed: {
    ...mapGetters('feeds', [
      'hasFeeds'
    ])
  }
}
</script>
