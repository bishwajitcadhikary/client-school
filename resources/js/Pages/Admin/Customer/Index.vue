<template>
  <AdminLayout :title="$t('Customers')">
    <VContainer>
      <VCard>
        <VTable>
          <thead>
            <tr>
              <th>#</th>
              <th>{{ $t('Name') }}</th>
              <th>{{ $t('Email') }}</th>
              <th>{{ $t('Balance') }}</th>
              <th class="text-center">
                {{ $t('Status') }}
              </th>
              <th>{{ $t('Registered At') }}</th>
              <th />
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
              <td>{{ customer.email }}</td>
              <td>{{ customer.balance }}</td>
              <td class="text-center">
                <VChip
                  v-if="customer.status === 1"
                  class="ma-2"
                  color="primary"
                >
                  {{ $t('Active') }}
                </VChip>
                <VChip
                  v-if="customer.status === 0"
                  class="ma-2"
                  color="secondary"
                >
                  {{ $t('Inactive') }}
                </VChip>
                <VChip
                  v-if="customer.status === 2"
                  class="ma-2"
                  color="red"
                  text-color="white"
                >
                  {{ $t('Suspended') }}
                </VChip>
              </td>
              <td>{{ moment(customer.created_at).format($page.props.app.date_format) }}</td>
              <td />
            </tr>
          </tbody>
        </VTable>

        <div class="mb-5 mt-5">
          <Pagination :pagination="customers" />
        </div>
      </VCard>
    </VContainer>
  </AdminLayout>
</template>

<script setup>
import moment from "moment"
import Pagination from "@/Components/Pagination.vue"

const props = defineProps({
  customers: {
    type: Object,
    default: null,
  },
})
</script>
