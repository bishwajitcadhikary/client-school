<script setup>
import {trans} from "laravel-vue-i18n"
import {inject, ref} from "vue"
import {useForm} from "@inertiajs/inertia-vue3"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  languages: {
    type: Object,
    default: null,
  },
})

const snackbarStore = useSnackbarStore()

const dialog = ref(false)
const deletableLangId = ref(null)

const headers = [
  trans('Name'),
  trans('Code'),
  trans('Status'),
  trans('Default'),
]


const statusForm = useForm({
  statuses: [...props.languages.data.map(i => !!i['is_active'])],
})

function updateLanguageStatus(key, id) {
  useForm({
    _method: 'PUT',
    is_active: statusForm.statuses[key],
  }).post(route('admin.settings.languages.change-status', {language: id}), {
    onSuccess: page => {
      snackbarStore.showNotification(page)
      statusForm.statuses = page.props.languages.data.map(i => !!i['is_active'])
    },
  })
}

const defaultForm = useForm({
  statuses: [...props.languages.data.map(i => !!i['is_default'])],
})
function changeDefaultLanguage(key, id) {
  useForm({
    _method: 'PUT',
    is_default: statusForm.statuses[key],
  }).post(route('admin.settings.languages.change-default', {language: id}), {
    onSuccess: page => {
      snackbarStore.showNotification(page)
      defaultForm.statuses = page.props.languages.data.map(i => !!i['is_default'])
    },
  })
}

function deleteLanguage() {
  dialog.value = false
  useForm({})
    .delete(route('admin.settings.languages.destroy', {language: deletableLangId.value}), {
      onSuccess: page => {
        snackbarStore.showNotification(page)
        statusForm.statuses = page.props.languages.data.map(i => !!i['is_active'])
        defaultForm.statuses = page.props.languages.data.map(i => !!i['is_default'])
      },
    })
}
</script>

<template>
  <AppLayout
    :title="$t('Languages')"
    :action="{href: route('admin.settings.languages.create'), icon: 'mdi-plus', title: $t('Add New')}"
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
              <th v-for="header in headers">
                {{ header }}
              </th>
              <th />
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(language, key) in languages.data"
              :key="key"
            >
              <td>{{ language.name }}</td>
              <td>{{ language.code }}</td>
              <td>
                <VSwitch
                  v-model="statusForm.statuses[key]"
                  color="primary"
                  hide-detail
                  @change="updateLanguageStatus(key, language.id)"
                />
              </td>
              <td>
                <VSwitch
                  v-model="defaultForm.statuses[key]"
                  color="primary"
                  hide-details
                  @change="changeDefaultLanguage(key, language.id)"
                />
              </td>
              <td
                class="pa-1"
                width="10%"
              >
                <VBtnToggle
                  rounded="xl"
                >
                  <VTooltip :text="$t('Edit Phrases')">
                    <template #activator="{ props }">
                      <VBtn
                        icon="mdi-translate"
                        v-bind="props"
                        @click="$inertia.visit(route('admin.settings.languages.edit-phrases', {language: language.id}))"
                      />
                    </template>
                  </VTooltip>
                  <VTooltip :text="$t('Edit Language')">
                    <template #activator="{ props }">
                      <VBtn
                        icon="mdi-clipboard-edit-outline"
                        v-bind="props"
                        @click="$inertia.visit(route('admin.settings.languages.edit', {language: language.id}))"
                      />
                    </template>
                  </VTooltip>
                  <VTooltip :text="$t('Delete Language')">
                    <template #activator="{props}">
                      <VBtn
                        v-if="!language.is_default"
                        icon="mdi-delete-outline"
                        v-bind="props"
                        @click="dialog = true; deletableLangId = language.id"
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
    <VDialog
      v-model="dialog"
      max-width="290"
    >
      <VCard class="pa-3">
        <VCardTitle class="text-h5 text-center">
          {{ $t('Are your sure to delete?') }}
        </VCardTitle>

        <VCardText class="text-center">
          <p>{{ $t('Action cannot be undone') }}</p>
        </VCardText>

        <VCardActions>
          <VSpacer />

          <VBtn
            @click="dialog = false"
          >
            {{ $t('Cancel') }}
          </VBtn>

          <VBtn
            color="error"
            @click.stop="deleteLanguage"
          >
            {{ $t('Delete') }}
          </VBtn>
        </VCardActions>
      </VCard>
    </VDialog>
  </AppLayout>
</template>
