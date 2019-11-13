<template lang="pug">
  div.columns.is-centered.is-vcentered
    .column.is-half
      h1.title Add Feed
      form(@submit="create")
        b-field(label="Name")
          b-input(
            v-model="name"
            required
          )
        b-field(label="Url")
          b-input(
            v-model="url"
            icon="rss"
            required
          )
        b-field(
          position="is-right"
          grouped
        )
          b-button(
            type="is-primary"
            native-type="submit"
            :loading="saving"
          ) Create
</template>

<script>
import { mapActions } from 'vuex'
export default {
  name: 'FeedNew',
  data() {
    return {
      name: '',
      url: '',
      saving: false
    }
  },
  methods: {
    ...mapActions('feeds', [
      'addFeed'
    ]),
    async create() {
      this.saving = true
      await this.addFeed({
        name: this.name,
        url: this.url
      })
      this.saving = false
    }
  }
}
</script>
