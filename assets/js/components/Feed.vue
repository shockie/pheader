<template lang="pug">
  .columns
    .column.is-one-quarter(v-if="hasFeeds")
      ul
        li Feed 1
    .column
      ItemList(
        :items="[]"
      )
</template>

<script>
import { mapGetters } from 'vuex'
import ItemList from 'components/ItemList'

export default {
  name: 'Feed',
  components: {
    ItemList
  },
  computed: {
    ...mapGetters('feeds', [
      'hasFeeds'
    ])
  }
}
</script>
