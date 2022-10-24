<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'

const props = defineProps({
  currencies: {
    type: Object,
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

const form = useForm({
  currency: null,
  language: null,
  time_zone: null,
  date_format: null,
  financial_year: null,
})

function updateSettings() {
  form.put(route('admin.settings.preferences.update'))
}
</script>

<template>
  <AdminLayout :title="$t('Preferences')">
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
                  persistent-hint
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

              <VCol
                class="12"
                sm="6"
              >
                <VSelect
                  v-model="form.financial_year"
                  :label="$t('Financial Year')"
                  :items="financialYears"
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
  </AdminLayout>
</template>
