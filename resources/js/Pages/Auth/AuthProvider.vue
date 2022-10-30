<script setup>
import { useTheme } from 'vuetify'

const vuetifyTheme = useTheme()
const authProviders = [
  {
    provider: 'facebook',
    icon: 'mdi-facebook',
    color: '#4267b2',
    colorInDark: '#4267b2',
  },
  {
    provider: 'twitter',
    icon: 'mdi-twitter',
    color: '#1da1f2',
    colorInDark: '#1da1f2',
  },
  {
    provider: 'google',
    icon: 'mdi-google',
    color: '#272727',
    colorInDark: '#fff',
  },
]
</script>

<template>
  <VBtn
    v-for="link in authProviders"
    :key="link.icon"
    :icon="link.icon"
    variant="text"
    :color="vuetifyTheme.global.name.value === 'dark' ? link.colorInDark : link.color"
    :href="route('oauth.redirect', link.provider)"
  />
</template>
