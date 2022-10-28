<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import rules from '@/plugins/rules'
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const snackbarStore = useSnackbarStore()

const form = useForm({
  name: null,
  rate: null,
  code: null,
  precision: null,
  symbol: null,
  swap_currency_symbol: null,
  decimal_separator: null,
  thousand_separator: null,
  is_active: null,
  is_default: null,
})

function submit() {
  form.post(route('admin.settings.currencies.store'))
}
</script>

<template>
  <AppLayout
    :back="route('admin.settings.languages.index')"
    :title="$t('Create Language')"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>
    <VContainer>
      <VCard>
        <VCardTitle>{{ $t('Create Language') }}</VCardTitle>
        <VCardSubtitle>{{ $t('Here you can create new language') }}</VCardSubtitle>
        <VCardText>
          <VForm @submit.prevent="submit">
            <VRow>
              <VCol
                cols="12"
                lg="6"
              >
                <VTextField
                  v-model="form.name"
                  :error-messages="form.errors.name"
                  :label="$t('Name')"
                  :rules="[rules.required]"
                />
              </VCol>

              <VCol
                cols="12"
                lg="6"
              >
                <VTextField
                  v-model="form.code"
                  :error-messages="form.errors.code"
                  :label="$t('Code')"
                  :rules="[rules.required]"
                />
              </VCol>

              <VCol
                cols="12"
                lg="6"
              >
                <VTextField
                  v-model="form.rate"
                  :error-messages="form.errors.rate"
                  :label="$t('Rate')"
                  :rules="[rules.required]"
                  type="number"
                />
              </VCol>

              <VCol
                cols="12"
                lg="6"
              >
                <VSelect
                  v-model="form.precision"
                  :error-messages="form.errors.precision"
                  :items="['0',1,2,3,4]"
                  :label="$t('Precision')"
                  :rules="[rules.required]"
                />
              </VCol>

              <VCol
                cols="12"
                lg="6"
              >
                <VTextField
                  v-model="form.symbol"
                  :error-messages="form.errors.symbol"
                  :label="$t('Symbol')"
                  :rules="[rules.required]"
                />
              </VCol>

              <VCol
                cols="12"
                lg="6"
              >
                <VSelect
                  v-model="form.swap_currency_symbol"
                  :error-messages="form.errors.swap_currency_symbol"
                  :items="[
                    {
                      title: $t('After Amount'),
                      value: true
                    },
                    {
                      title: $t('Before Amount'),
                      value: false
                    },
                  ]"
                  :label="$t('Symbol Position')"
                />
              </VCol>

              <VCol
                cols="12"
                lg="6"
              >
                <VTextField
                  v-model="form.decimal_separator"
                  :error-messages="form.errors.decimal_separator"
                  :label="$t('Decimal Separator')"
                  :rules="[rules.required]"
                />
              </VCol>

              <VCol
                cols="12"
                lg="6"
              >
                <VTextField
                  v-model="form.thousand_separator"
                  :error-messages="form.errors.thousand_separator"
                  :label="$t('Thousands Separator')"
                />
              </VCol>
            </VRow>

            <VCol cols="12">
              <VSwitch
                v-model="form.is_active"
                :error-messages="form.errors.is_active"
                :label="$t('Active')"
                class="mb-5"
              />

              <VSwitch
                v-model="form.is_default"
                :error-messages="form.errors.is_default"
                :label="$t('Default')"
                class="mb-5"
              />
            </VCol>

            <VBtn
              :loading="form.processing"
              type="submit"
            >
              <VIcon icon="mdi-content-save" />
              {{ $t('Save') }}
            </VBtn>
          </VForm>
        </VCardText>
      </VCard>
    </VContainer>
  </AppLayout>
</template>
