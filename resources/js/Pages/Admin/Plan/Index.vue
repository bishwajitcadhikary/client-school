<script setup>
import {inject} from "vue"
import Pagination from "@/Components/Pagination.vue"
import {useDeleteDialogStore} from "@/Stores/useDeleteDialogStore"

const props = defineProps({
  plans: {
    type: Object,
    default: null,
  },
})

const currencyFormat = inject('currencyFormat')
const dateFormat = inject('dateFormat')
</script>

<template>
  <AdminLayout
    :title="$t('Plans')"
    :actions="[
      {
        title: $t('New Plan'),
        href: route('admin.plans.create'),
        icon: 'mdi-plus'
      }
    ]"
  >
    <VContainer>
      <VCard>
        <VTable>
          <thead>
            <tr>
              <th>#</th>
              <th>{{ $t('Name') }}</th>
              <th>{{ $t('Monthly Price') }}</th>
              <th>{{ $t('Yearly Price') }}</th>
              <th>{{ $t('School Limit') }}</th>
              <th>{{ $t('Customer Limit') }}</th>
              <th>{{ $t('Total Customer') }}</th>
              <th class="text-center">
                {{ $t('Status') }}
              </th>
              <th class="text-center">
                {{ $t('Trial') }}
              </th>
              <th>{{ $t('Created At') }}</th>
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
              v-for="(plan, key) in plans.data"
              :key="key"
            >
              <td width="5%">
                {{ key + 1 }}
              </td>
              <td>{{ plan.name }}</td>
              <td>{{ currencyFormat(plan.monthly_price, $page.props.app.currency.code) }}</td>
              <td>{{ currencyFormat(plan.yearly_price, $page.props.app.currency.code) }}</td>
              <td>{{ plan.school_limit }}</td>
              <td>{{ plan.max_limit }}</td>
              <td>{{ plan.max_limit }}</td>
              <td class="text-center">
                <VChip
                  v-if="plan.is_active"
                  class="ma-2"
                  color="primary"
                >
                  {{ $t('Active') }}
                </VChip>
                <VChip
                  v-if="!plan.is_active"
                  class="ma-2"
                  color="secondary"
                >
                  {{ $t('Inactive') }}
                </VChip>
              </td>
              <td class="text-center">
                <VChip
                  v-if="plan.is_trial"
                  class="ma-2"
                  color="primary"
                >
                  {{ $t('Yes') }}
                </VChip>
                <VChip
                  v-if="!plan.is_trial"
                  class="ma-2"
                  color="secondary"
                >
                  {{ $t('No') }}
                </VChip>
              </td>
              <td>{{ dateFormat(plan.created_at) }}</td>
              <td class="text-center">
                <VTooltip :text="$t('View Plan')">
                  <template #activator="{ props }">
                    <VBtn
                      variant="plain"
                      size="small"
                      icon="mdi-eye-outline"
                      v-bind="props"
                      @click="$inertia.visit(route('admin.plans.show', {plan: plan.id}))"
                    />
                  </template>
                </VTooltip>
                <VTooltip :text="$t('Edit Plan')">
                  <template #activator="{ props }">
                    <VBtn
                      variant="plain"
                      size="small"
                      icon="mdi-clipboard-edit-outline"
                      v-bind="props"
                      @click="$inertia.visit(route('admin.plans.edit', {plan: plan.id}))"
                    />
                  </template>
                </VTooltip>
                <VTooltip
                  :text="$t('Delete Plan')"
                >
                  <template #activator="{props}">
                    <VBtn
                      variant="plain"
                      size="small"
                      icon="mdi-delete-outline"
                      v-bind="props"
                      @click="useDeleteDialogStore().showDialog(route('admin.plans.destroy', {plan: plan.id}))"
                    />
                  </template>
                </VTooltip>
              </td>
            </tr>
          </tbody>
        </VTable>

        <div class="mb-5 mt-5">
          <Pagination :pagination="plans" />
        </div>
      </VCard>
    </VContainer>
  </AdminLayout>
</template>
