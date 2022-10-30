<script setup>
import Table from '@/Pages/Admin/Order/Table.vue'
const props = defineProps({
  orders: {
    type: Object,
    default: null,
  },
})
</script>

<template>
  <AppLayout :title="$t('Orders')">
    <VContainer>
      <Table :orders="orders" />
    </VContainer>
  </AppLayout>
</template>
