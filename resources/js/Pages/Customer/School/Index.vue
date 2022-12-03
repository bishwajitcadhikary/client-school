<script setup>
import {inject} from "vue"
import {Inertia} from '@inertiajs/inertia'
import Pagination from "@/Components/Pagination.vue"
import DataNotFound from "@/Components/DataNotFound.vue"
import {useDeleteDialogStore} from "@/Stores/useDeleteDialogStore"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  schools: {
    type: Object,
    default: null,
  },
})

const currencyFormat = inject('currencyFormat')
const dateFormat = inject('dateFormat')

const retryDatabaseCreation = school => {
  Inertia.post(route('customer.schools.database-creation-retry', {school}), {}, {
    preserveState: true,
    preserveScroll: true,
    onSuccess: page => {
      useSnackbarStore().showNotification(page)
    },
  })
}
</script>

<template>
  <AppLayout
    :title="$t('Schools')"
    :actions="[
      {
        title: $t('New School'),
        href: route('customer.schools.create'),
        icon: 'mdi-plus'
      }
    ]"
  >
    <VContainer>
      <VCard>
        <VTable v-if="schools.data.length">
          <thead>
            <tr>
              <th>#</th>
              <th>{{ $t('School Name') }}</th>
              <th>{{ $t('Domain') }}</th>
              <th class="text-center">
                {{ $t('Database') }}
              </th>
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
              v-for="(school, key) in schools.data"
              :key="key"
            >
              <td width="5%">
                {{ key + 1 }}
              </td>
              <td>{{ school.name }}</td>
              <td>
                <a
                  :href="'https://'+school.domain"
                  target="_blank"
                >
                  {{ school.domain }}
                </a>
              </td>
              <td class="text-center">
                <VChip
                  v-if="school.database_created == 1"
                  class="ma-2"
                  color="primary"
                >
                  {{ $t('Created') }}
                </VChip>


                <VTooltip :text="$t('Click to refresh')">
                  <template #activator="{ props }">
                    <VBtn
                      v-if="school.database_created == 0"
                      class="ma-2"
                      color="secondary"
                      rounded
                      size="small"
                      v-bind="props"
                      @click="$inertia.reload()"
                    >
                      {{ $t('Creating') }}

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

                <VTooltip :text="$t('Click to retry')">
                  <template #activator="{props}">
                    <VBtn
                      v-if="school.database_created == 2"
                      class="ma-2 text-white"
                      color="error"
                      rounded
                      size="small"
                      v-bind="props"
                      @click="retryDatabaseCreation(school.id)"
                    >
                      {{ $t('Failed') }}

                      <VIcon>mdi-reload</VIcon>
                    </VBtn>
                  </template>
                </VTooltip>
              </td>
              <td class="text-center">
                <VChip
                  v-if="school.is_active"
                  class="ma-2"
                  color="primary"
                >
                  {{ $t('Active') }}
                </VChip>
                <VChip
                  v-if="!school.is_active"
                  class="ma-2"
                  color="secondary"
                >
                  {{ $t('Inactive') }}
                </VChip>
              </td>
              <td>{{ dateFormat(school.created_at) }}</td>
              <td class="text-center">
                <VTooltip :text="$t('Edit School')">
                  <template #activator="{ props }">
                    <VBtn
                      variant="plain"
                      size="small"
                      icon="mdi-clipboard-edit-outline"
                      v-bind="props"
                      @click="$inertia.visit(route('customer.schools.edit', {school: school.id}))"
                    />
                  </template>
                </VTooltip>
                <VTooltip
                  :text="$t('Delete School')"
                >
                  <template #activator="{props}">
                    <VBtn
                      variant="plain"
                      size="small"
                      icon="mdi-delete-outline"
                      v-bind="props"
                      @click="useDeleteDialogStore().showDialog(route('customer.schools.destroy', {school: school.id}))"
                    />
                  </template>
                </VTooltip>
              </td>
            </tr>
          </tbody>
        </VTable>

        <VCardText>
          <DataNotFound v-if="!!!schools.data.length" />

          <Pagination :pagination="schools" />
        </VCardText>
      </VCard>
    </VContainer>
  </AppLayout>
</template>
