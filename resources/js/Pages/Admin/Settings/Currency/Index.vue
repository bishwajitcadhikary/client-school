<script setup>
import {ref} from "vue"
import {useForm} from "@inertiajs/inertia-vue3"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"
import Pagination from "@/Components/Pagination.vue"
import {useDeleteDialogStore} from "@/Stores/useDeleteDialogStore"

const props = defineProps({
  currencies: {
    type: Object,
    default: null,
  },
  last_sync_at: {
    type: String,
    default: null,
  },
})

const snackbarStore = useSnackbarStore()
const dialogStore = useDeleteDialogStore()

const switchesForm = useForm({
  statuses: [...props.currencies.data.map(i => !!i['is_active'])],
  default: [...props.currencies.data.map(i => !!i['is_default'])],
})

function updateCurrencyStatus(key, id) {
  useForm({
    _method: 'PUT',
    is_active: switchesForm.statuses[key],
  }).post(route('admin.settings.currencies.change-status', {currency: id}), {
    preserveScroll: true,
    preserveState: true,
    onSuccess: page => {
      snackbarStore.showNotification(page)
      switchesForm.statuses = page.props.currencies.data.map(i => !!i['is_active'])
    },
  })
}

function updateCurrencyDefault(key, id) {
  useForm({
    _method: 'PUT',
    is_default: switchesForm.default[key],
  }).post(route('admin.settings.currencies.change-default', {currency: id}), {
    preserveScroll: true,
    preserveState: true,
    onSuccess: page => {
      snackbarStore.showNotification(page)
      switchesForm.default = page.props.currencies.data.map(i => !!i['is_default'])
    },
  })
}

const syncForm = useForm({_method: 'PUT'})
</script>

<template>
  <AppLayout :title="$t('Currencies')">
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>

    <template #actions>
      <p class="mt-4 mr-2">
        {{ last_sync_at }}
      </p>
      <VBtn
        :loading="syncForm.processing"
        @click="syncForm.post(route('admin.settings.currencies.sync'),{onSuccess: page => snackbarStore.showNotification(page)})"
      >
        <VIcon>mdi-plus</VIcon>
        {{ $t('Sync') }}
      </VBtn>
      <Link :href="route('admin.settings.currencies.create')">
        <VBtn>
          <VIcon>mdi-plus</VIcon>
          {{ $t('Add New') }}
        </VBtn>
      </Link>
    </template>

    <VContainer>
      <VCard>
        <VTable
          class="table-rounded"
        >
          <thead>
            <tr>
              <th>{{ $t('Name') }}</th>
              <th>{{ $t('Code') }}</th>
              <th>{{ $t('Rate') }}</th>
              <th>{{ $t('Is Active') }}</th>
              <th>{{ $t('Is Default') }}</th>
              <th />
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(currency, key) in currencies.data"
              :key="key"
            >
              <td>{{ currency.name }}</td>
              <td>{{ currency.code }}</td>
              <td>{{ currency.rate }}</td>
              <td>
                <VSwitch
                  v-model="switchesForm.statuses[key]"
                  color="primary"
                  hide-detail
                  @change="updateCurrencyStatus(key, currency.id)"
                />
              </td>
              <td>
                <VSwitch
                  v-model="switchesForm.default[key]"
                  color="primary"
                  hide-detail
                  @change="updateCurrencyDefault(key, currency.id)"
                />
              </td>

              <td
                class="pa-1"
                width="10%"
              >
                <VBtnToggle
                  rounded="xl"
                >
                  <VTooltip :text="$t('Edit Currency')">
                    <template #activator="{ props }">
                      <VBtn
                        icon="mdi-clipboard-edit-outline"
                        v-bind="props"
                        @click="$inertia.visit(route('admin.settings.currencies.edit', {currency: currency.id}))"
                      />
                    </template>
                  </VTooltip>
                  <VTooltip
                    v-if="!currency.is_default"
                    :text="$t('Delete Currency')"
                  >
                    <template #activator="{props}">
                      <VBtn
                        icon="mdi-delete-outline"
                        v-bind="props"
                        @click="dialogStore.showDialog(route('admin.settings.currencies.destroy', {currency: currency.id}))"
                      />
                    </template>
                  </VTooltip>
                </VBtnToggle>
              </td>
            </tr>
          </tbody>
        </VTable>

        <Pagination :pagination="currencies" />
      </VCard>
    </VContainer>
  </AppLayout>
</template>
