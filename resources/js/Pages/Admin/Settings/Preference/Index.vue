<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  settings: {
    type: Object,
    default: null,
  },
  currencies: {
    type: Array,
    default: null,
  },
  languages: {
    type: Object,
    default: null,
  },
  dateFormatters: {
    type: Array,
    default: null,
  },
  timeZones: {
    type: Array,
    default: null,
  },
  financialYears: {
    type: Array,
    default: null,
  },
})
const snackbarStore = useSnackbarStore()
const form = useForm({
  _method: 'PUT',
  currency: props.currencies.find(c => c.value == props.settings?.currency),
  language: props.languages.find(c => c.value == props.settings?.language),
  time_zone: props.timeZones.find(c => c.value == props.settings?.time_zone),
  date_format: props.dateFormatters.find(c => c.value == props.settings?.date_format),
})

function updateSettings() {
  form.post(route('admin.settings.preferences.update'), {
    onSuccess: page => snackbarStore.showSnackbar(page),
  })
}
</script>

<template>
  <AppLayout :title="$t('Preferences')">
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>
    <VContainer>
      <VForm @submit.prevent="updateSettings">
        <VCard class="pa-3">
          <VCardTitle>{{ $t('Preferences') }}</VCardTitle>
          <VCardSubtitle>{{ $t('Default preferences for the system.') }}</VCardSubtitle>
          <VCardText>
            <VRow>
              <VCol
                class="12"
                sm="6"
              >
                <VSelect
                  v-model="form.currency"
                  :label="$t('Currency')"
                  :items="currencies"
                  :error-message="form.errors.currency"
                  :disabled="settings.currency"
                />
              </VCol>

              <VCol
                class="12"
                sm="6"
              >
                <VSelect
                  v-model="form.language"
                  :label="$t('Default Language')"
                  :items="languages"
                />
              </VCol>

              <VCol
                class="12"
                sm="6"
              >
                <VSelect
                  v-model="form.time_zone"
                  :label="$t('Time Zone')"
                  :items="timeZones"
                />
              </VCol>

              <VCol
                class="12"
                sm="6"
              >
                <VSelect
                  v-model="form.date_format"
                  :label="$t('Date Format')"
                  :items="dateFormatters"
                />
              </VCol>

              <VCol cols="12">
                <VBtn
                  :loading="form.processing"
                  type="submit"
                >
                  <VIcon icon="mdi-content-save" />
                  {{ $t('Save') }}
                </VBtn>
              </VCol>
            </VRow>
          </VCardText>
        </VCard>
      </VForm>
    </VContainer>
  </AppLayout>
</template>
