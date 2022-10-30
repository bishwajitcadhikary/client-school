<script setup>
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
import {inject, ref} from "vue"
import {useDeleteDialogStore} from "@/Stores/useDeleteDialogStore"

const props = defineProps({
  gateways: {
    type: Object,
    default: null,
  },
})

const currencyFormat = inject('currencyFormat')
const dialog = ref(false)
</script>

<template>
  <AppLayout
    :action="{href: route('admin.settings.gateways.create'), icon: 'mdi-plus', title: $t('Add New')}"
    :title="$t('Gateways')"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>

    <VContainer>
      <VCard>
        <VTable
          class="table-rounded"
        >
          <thead>
            <tr>
              <th width="5%">
                #
              </th>
              <th>{{ $t('Logo') }}</th>
              <th>{{ $t('Name') }}</th>
              <th>{{ $t('Namespace') }}</th>
              <th>{{ $t('Currency') }}</th>
              <th>{{ $t('Charge') }}</th>
              <th>{{ $t('Min Amount') }}</th>
              <th>{{ $t('Max Amount') }}</th>
              <th class="text-center">
                {{ $t('Status') }}
              </th>
              <th>{{ $t('Actions') }}</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(gateway, key) in gateways.data"
              :key="key"
            >
              <td>{{ key + 1 }}</td>
              <td>
                <VImg
                  :src="gateway.logo"
                  height="50"
                />
              </td>
              <td>{{ gateway.name }}</td>
              <td>{{ gateway.namespace }}</td>
              <td>{{ gateway.currency.code }}</td>
              <td>{{ currencyFormat(gateway.charge, gateway.currency.code) }}</td>
              <td>{{ currencyFormat(gateway.min_amount, gateway.currency.code) }}</td>
              <td>{{ currencyFormat(gateway.max_amount, gateway.currency.code) }}</td>
              <td class="text-center">
                <VChip
                  v-if="!!gateway.is_active"
                  color="primary"
                >
                  {{ $t('Active') }}
                </VChip>
                <VChip
                  v-else
                  color="red"
                  text-color="white"
                >
                  {{ $t('Inactive') }}
                </VChip>
              </td>
              <td
                class="pa-1"
                width="10%"
              >
                <VBtnToggle
                  rounded="xl"
                >
                  <VTooltip :text="$t('Edit Gateway')">
                    <template #activator="{ props }">
                      <VBtn
                        icon="mdi-clipboard-edit-outline"
                        v-bind="props"
                        @click="$inertia.visit(route('admin.settings.gateways.edit', {gateway: gateway.id}))"
                      />
                    </template>
                  </VTooltip>
                  <VTooltip :text="$t('Delete Gateway')">
                    <template #activator="{props}">
                      <VBtn
                        v-if="!gateway.is_default"
                        icon="mdi-delete-outline"
                        v-bind="props"
                        @click="useDeleteDialogStore().showDialog(route('admin.settings.gateways.destroy', {gateway: gateway.id}))"
                      />
                    </template>
                  </VTooltip>
                </VBtnToggle>
              </td>
            </tr>
          </tbody>
        </VTable>
      </VCard>
    </VContainer>
  </AppLayout>
</template>
