<template lang="pug">
  section.section.main-section.has-background-primary
    .columns.is-centered
      .column.is-one-quarter
        .card
          header.card-header
            p.card-header-title Login
            .card-header-icon
              b-icon(icon="address-card" pack="fas")
          .card-content
            form(@submit="submit")
              b-field(label="Email")
                b-input(v-model="user.email")
              b-field(label="Password")
                b-input(
                  v-model="user.password"
                  type="password"
                )
              .field
                b-checkbox(v-model="rememberMe") Remember me
              .field
                .control
                  b-button(type="is-primary", native-type="submit") Login

</template>

<script>

import { mapActions } from 'vuex'

export default {
  name: 'Login',
  data() {
    return {
      user: {
        email: null,
        password: null
      },
      rememberMe: false
    }
  },
  methods: {
    ...mapActions([
      'login'
    ]),
    async submit(){
      try {
        await this.login({...this.user, rememberMe: this.rememberMe})
        if (this.$route.query.redirect) {
          this.$router.push(this.$route.query.redirect)
        } else {
          this.$router.push({
            name: 'root'
          })
        }
      } catch(e) {
        this.$buefy.toast.open({
          message: e.message,
          type: 'is-danger'
        })
      }
    }
  }
}
</script>
