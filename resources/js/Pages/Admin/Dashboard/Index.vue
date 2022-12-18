<script setup>
import {inject} from "vue"
import Table from '@/Pages/Admin/Order/Table.vue'

const props = defineProps({
  totalEarnings: {
    type: Number,
    required: true,
  },
  totalOrders: {
    type: Number,
    required: true,
  },
  totalCustomers: {
    type: Number,
    required: true,
  },
  orders: {
    type: Object,
    default: null,
  },
})

const currencyFormat = inject('currencyFormat')
</script>

<template>
  <AppLayout :title="$t('Dashboard')">
    <VRow class="match-height">
      <VCol
        cols="12"
      >
        <VRow class="match-height">
          <VCol
            cols="12"
            sm="4"
          >
            <VCard>
              <VCardTitle>{{ $t('Total Earnings') }}</VCardTitle>
              <VCardText>
                {{ currencyFormat(totalEarnings, $page.props?.app?.currency?.code) }}
              </VCardText>
            </VCard>
          </VCol>
          <VCol
            cols="12"
            sm="4"
          >
            <VCard>
              <VCardTitle>{{ $t('Total Orders') }}</VCardTitle>
              <VCardText>
                {{ totalOrders }}
              </VCardText>
            </VCard>
          </VCol>
          <VCol
            cols="12"
            sm="4"
          >
            <VCard>
              <VCardTitle>{{ $t('Total Customers') }}</VCardTitle>
              <VCardText>
                {{ totalCustomers }}
              </VCardText>
            </VCard>
          </VCol>
        </VRow>
      </VCol>

      <VCol cols="12">
        <Table :orders="orders" />
      </VCol>
    </VRow>
  </AppLayout>
</template>
