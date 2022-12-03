<script setup>
import dataNotFound from '@/assets/data-not-found.png'
</script>

<template>
  <VRow justify="center">
    <VCol
      cols="12"
      md="6"
      class="text-center"
    >
      <VImg
        :src="dataNotFound"
      />
    </VCol>
  </VRow>
</template>
