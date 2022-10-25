<script>
const snackbar = ref(false)
const message = ref(null)
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
