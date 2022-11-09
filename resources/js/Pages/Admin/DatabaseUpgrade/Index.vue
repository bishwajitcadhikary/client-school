<script setup>
import {inject} from "vue"
import {Inertia} from '@inertiajs/inertia'
import Pagination from "@/Components/Pagination.vue"
import {useDeleteDialogStore} from "@/Stores/useDeleteDialogStore"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  upgrades: {
    type: Object,
    default: null,
  },
})

const retryDatabaseCreation = school => {
  Inertia.post(route('admin.schools.database-creation-retry', {school}), {}, {
    preserveState: true,
    preserveScroll: true,
    onSuccess: page => {
      useSnackbarStore().showNotification(page)
    },
  })
}

const currencyFormat = inject('currencyFormat')
const dateFormat = inject('dateFormat')
</script>

<template>
  <AppLayout
    :title="$t('Database Upgrade')"
    :actions="[
      {
        title: $t('New Upgrade'),
        href: route('admin.database-upgrades.create'),
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
              <th>{{ $t('Version') }}</th>
              <th>{{ $t('Database') }}</th>
              <th>{{ $t('Change Log') }}</th>
              <th class="text-center">
                {{ $t('Status') }}
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
              v-for="(upgrade, key) in upgrades.data"
              :key="key"
            >
              <td width="5%">
                {{ key + 1 }}
              </td>
              <td>{{ upgrade.version }}</td>
              <td>{{ upgrade.database }}</td>
              <td>{{ upgrade.change_log }}</td>
              <td class="text-center">
                <VChip
                  v-if="upgrade.status === 'success'"
                  class="ma-2"
                  color="primary"
                  prepend-icon="mdi-check"
                >
                  {{ $t('Success') }}
                </VChip>
                <VChip
                  v-if="upgrade.status === 'failed'"
                  class="ma-2"
                  color="error"
                  prepend-icon="mdi-close"
                >
                  {{ $t('Failed') }}
                </VChip>


                <VTooltip :text="$t('Click to refresh')">
                  <template #activator="{ props }">
                    <VBtn
                      v-if="upgrade.status === 'running'"
                      class="ma-2"
                      color="secondary"
                      rounded
                      size="small"
                      v-bind="props"
                      @click="$inertia.reload()"
                    >
                      {{ $t('Running') }}

                      <VProgressCircular
                        class="ml-3"
                        :width="3"
                        size="x-small"
                        color="red"
                        indeterminate
                      />
                    </VBtn>
                  </template>
                </VTooltip>
              </td>
              <td>{{ dateFormat(upgrade.created_at) }}</td>
              <td class="text-center">
                <VTooltip :text="$t('View Upgrade')">
                  <template #activator="{ props }">
                    <VBtn
                      variant="plain"
                      size="small"
                      icon="mdi-eye-outline"
                      v-bind="props"
                      @click="$inertia.visit(route('admin.database-upgrades.show', upgrade.id))"
                    />
                  </template>
                </VTooltip>
                <VTooltip
                  :text="$t('Delete Upgrade')"
                >
                  <template #activator="{props}">
                    <VBtn
                      variant="plain"
                      size="small"
                      icon="mdi-delete-outline"
                      v-bind="props"
                      @click="useDeleteDialogStore().showDialog(route('admin.database-upgrades.destroy', upgrade.id))"
                    />
                  </template>
                </VTooltip>
              </td>
            </tr>
          </tbody>
        </VTable>

        <div class="mb-5 mt-5">
          <Pagination :pagination="upgrades" />
        </div>
      </VCard>
    </VContainer>
  </AppLayout>
</template>
