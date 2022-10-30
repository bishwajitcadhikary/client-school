<script setup>
import {inject, ref} from "vue"

const props = defineProps({
  orders: {
    type: Object,
    default: null,
  },
})


const dateFormat = inject('dateFormat')

const showDetails = ref(false)

const orderInfo = ref(null)

const showOrderDetails = id => {
  showDetails.value = true
  orderInfo.value = props.orders.data.find(order => order.id === id)
}
</script>

<template>
  <AppLayout :title="$t('Orders')">
    <VRow class="match-height">
      <VCol cols="12">
        <VCard>
          <VTable
            class="table-rounded"
            hide-default-footer
          >
            <thead>
              <tr>
                <th>{{ $t('Order ID') }}</th>
                <th>{{ $t('Plan') }}</th>
                <th>{{ $t('Interval') }}</th>
                <th>{{ $t('Gateway') }}</th>
                <th class="text-center">
                  {{ $t('Status') }}
                </th>
                <th>{{ $t('Order At') }}</th>
                <th>{{ $t('Actions') }}</th>
              </tr>
            </thead>

            <tbody>
              <tr
                v-for="order in orders.data"
                :key="order.id"
              >
                <td>{{ order.id }}</td>
                <td>{{ order.plan.name }}</td>
                <td>{{ order.interval }}</td>
                <td>{{ order.gateway.name }}</td>
                <td class="text-center">
                  <VChip
                    v-if="order.status === 0"
                    color="warning"
                    dark
                  >
                    <VProgressCircular
                      width="3"
                      size="x-small"
                      class="me-3"
                      color="warning"
                      indeterminate
                    />
                    {{ $t('Pending') }}
                  </VChip>
                  <VChip
                    v-else-if="order.status === 1"
                    color="primary"
                    dark
                    prepend-icon="mdi-check"
                  >
                    {{ $t('Accepted') }}
                  </VChip>
                  <VChip
                    v-else
                    color="error"
                    dark
                    prepend-icon="mdi-close"
                  >
                    {{ $t('Rejected') }}
                  </VChip>
                </td>
                <td>{{ dateFormat(order.created_at) }}</td>
                <td class="text-center">
                  <VTooltip :text="$t('View Details')">
                    <template #activator="{ props }">
                      <VBtn
                        variant="plain"
                        size="small"
                        icon="mdi-eye-outline"
                        v-bind="props"
                        @click="showOrderDetails(order.id)"
                      />
                    </template>
                  </VTooltip>
                </td>
              </tr>
            </tbody>
          </VTable>
        </VCard>
      </VCol>
    </VRow>
  </AppLayout>
  <VDialog
    v-model="showDetails"
    max-width="500"
    persistent
  >
    <VCard>
      <VCardItem>
        <VCardTitle>
          {{ $t('Order Details') }}
        </VCardTitle>
      </VCardItem>

      <VCardText>
        <VTable>
          <tbody>
            <tr>
              <td>{{ $t('Order ID') }}</td>
              <td>{{ orderInfo.id }}</td>
            </tr>
            <tr>
              <td>{{ $t('Transaction ID') }}</td>
              <td>{{ orderInfo.trx_id }}</td>
            </tr>
            <tr>
              <td>{{ $t('Plan') }}</td>
              <td>{{ orderInfo.plan?.name }}</td>
            </tr>
            <tr>
              <td>{{ $t('Gateway') }}</td>
              <td>{{ orderInfo.gateway?.name }}</td>
            </tr>
            <tr>
              <td>{{ $t('Status') }}</td>
              <td>
                <VChip
                  v-if="orderInfo.status === 0"
                  color="warning"
                  dark
                >
                  <VProgressCircular
                    width="3"
                    size="x-small"
                    class="me-3"
                    color="warning"
                    indeterminate
                  />
                  {{ $t('Pending') }}
                </VChip>
                <VChip
                  v-else-if="orderInfo.status === 1"
                  color="primary"
                  dark
                  prepend-icon="mdi-check"
                >
                  {{ $t('Accepted') }}
                </VChip>
                <VChip
                  v-else
                  color="error"
                  dark
                  prepend-icon="mdi-close"
                >
                  {{ $t('Rejected') }}
                </VChip>
              </td>
            </tr>
            <tr>
              <td>{{ $t('Description') }}</td>
              <td>{{ orderInfo.description }}</td>
            </tr>
            <tr>
              <td>{{ $t('Order At') }}</td>
              <td>{{ dateFormat(orderInfo.created_at) }}</td>
            </tr>
            <tr>
              <td colspan="2">
                <VResponsive class="pa-5">
                  <img
                    :src="orderInfo.screenshot"
                    alt=""
                  >
                </VResponsive>
              </td>
            </tr>
          </tbody>
        </VTable>
      </VCardText>
      <VCardActions>
        <VBtn
          color="primary"
          variant="text"
          block
          @click="showDetails = false"
        >
          {{ $t('Close') }}
        </VBtn>
      </VCardActions>
    </VCard>
  </VDialog>
</template>
