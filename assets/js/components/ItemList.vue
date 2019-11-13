<template lang="pug">
  div
    .list(v-if="hasItems")
    .columns.is-vcentered.is-centered(v-else)
      .column.is-half
        h1.title No feeds yet
        .content
          p You have no items yet to read, add a feed to get started.
        b-button(
          tag="router-link"
          :to="{ name: 'newFeed' }"
          type="is-link"
        ) Create a feed
</template>

<script>
export default {
  name: 'ItemList',
  props: {
    items: {
      type: Array,
      default(){
        return []
      }
    }
  },
  computed: {
    hasItems() {
      return this.items.length != 0
    }
  }
}
</script>
