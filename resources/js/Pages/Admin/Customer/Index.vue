<script setup>
import {inject} from "vue"
import Pagination from "@/Components/Pagination.vue"
import {useDeleteDialogStore} from "@/Stores/useDeleteDialogStore"
import DataNotFound from "@/Components/DataNotFound.vue"

const props = defineProps({
  customers: {
    type: Object,
    default: null,
  },
})

const currencyFormat = inject('currencyFormat')
const dateFormat = inject('dateFormat')
</script>

<template>
  <AppLayout
    :title="$t('Customers')"
    :actions="[
      {
        title: $t('New Customer'),
        href: route('admin.customers.create'),
        icon: 'mdi-plus'
      }
    ]"
  >
    <VContainer>
      <VCard>
        <VTable v-if="customers.data.length">
          <thead>
            <tr>
              <th>#</th>
              <th>{{ $t('Name') }}</th>
              <th>{{ $t('Username') }}</th>
              <th>{{ $t('Email') }}</th>
              <th class="text-center">
                {{ $t('Status') }}
              </th>
              <th>{{ $t('Registered At') }}</th>
              <th>{{ $t('Plan Expire At') }}</th>
              <th
                class="text-center"
                width="15%"
              >
                {{ $t('Actions') }}
              </th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(customer, key) in customers.data"
              :key="key"
            >
              <td width="5%">
                {{ key + 1 }}
              </td>
              <td>{{ customer.name }}</td>
              <td>{{ customer.username }}</td>
              <td>{{ customer.email }}</td>
              <td class="text-center">
                <VChip
                  v-if="customer.status == 1"
                  class="ma-2"
                  color="primary"
                >
                  {{ $t('Active') }}
                </VChip>
                <VChip
                  v-if="customer.status == 0"
                  class="ma-2"
                  color="secondary"
                >
                  {{ $t('Inactive') }}
                </VChip>
                <VChip
                  v-if="customer.status == 2"
                  class="ma-2"
                  color="red"
                  text-color="white"
                >
                  {{ $t('Suspended') }}
                </VChip>
              </td>
              <td>{{ dateFormat(customer.created_at) }}</td>
              <td>{{ dateFormat(customer.plan_expire_at) }}</td>
              <td class="text-center">
                <VTooltip :text="$t('View Customer')">
                  <template #activator="{ props }">
                    <VBtn
                      variant="plain"
                      size="small"
                      icon="mdi-eye-outline"
                      v-bind="props"
                      @click="$inertia.visit(route('admin.customers.show', {customer: customer.id}))"
                    />
                  </template>
                </VTooltip>
                <VTooltip :text="$t('Edit Customer')">
                  <template #activator="{ props }">
                    <VBtn
                      variant="plain"
                      size="small"
                      icon="mdi-clipboard-edit-outline"
                      v-bind="props"
                      @click="$inertia.visit(route('admin.customers.edit', {customer: customer.id}))"
                    />
                  </template>
                </VTooltip>
                <VTooltip
                  :text="$t('Delete Customer')"
                >
                  <template #activator="{props}">
                    <VBtn
                      variant="plain"
                      size="small"
                      icon="mdi-delete-outline"
                      v-bind="props"
                      @click="useDeleteDialogStore().showDialog(route('admin.customers.destroy', {customer: customer.id}))"
                    />
                  </template>
                </VTooltip>
              </td>
            </tr>
          </tbody>
        </VTable>

        <VCardText>
          <DataNotFound v-if="!!!customers.data.length" />

          <Pagination :pagination="customers" />
        </VCardText>
      </VCard>
    </VContainer>
  </AppLayout>
</template>
