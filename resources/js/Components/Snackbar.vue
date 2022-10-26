<script setup>
import {ref,provide} from 'vue'

const snackbar = ref(false)
const message = ref(null)

const showSnackbar = message => {
  snackbar.value = true
  message.value = message
}

provide('showSnackbar', showSnackbar)
</script>

<template>
  <VSnackbar
    v-model="snackbar"
  >
    {{ message }}

    <template #actions>
      <VBtn
        color="pink"
        variant="text"
        @click="snackbar = false"
      >
        {{ $t('Close') }}
      </VBtn>
    </template>
  </VSnackbar>
</template>
