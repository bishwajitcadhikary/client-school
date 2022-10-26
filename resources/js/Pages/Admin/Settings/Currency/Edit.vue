<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import rules from '@/plugins/rules'
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  currency: {
    type: Object,
    required: true,
    default: null,
  },
})

const snackbarStore = useSnackbarStore()

const form = useForm({
  _method: 'PUT',
  name: props.currency.name,
  rate: props.currency.rate,
  code: props.currency.code,
  precision: props.currency.precision,
  symbol: props.currency.symbol,
  swap_currency_symbol: !!props.currency.swap_currency_symbol,
  decimal_separator: props.currency.decimal_separator,
  thousand_separator: props.currency.thousand_separator,
  is_active: !!props.currency.is_active,
  is_default: !!props.currency.is_default,
})

function submit() {
  form.post(route('admin.settings.currencies.update', {currency: props.currency.id}),{
    onSuccess: page => snackbarStore.showNotification(page),
  })
}
</script>

<template>
  <AdminLayout
    :back="route('admin.settings.currencies.index')"
    :title="$t('Edit Currency')"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>
    <VContainer>
      <VCard>
        <VCardTitle>{{ $t('Edit Currency') }}</VCardTitle>
        <VCardSubtitle>{{ $t('Here you can edit currency information') }}</VCardSubtitle>
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
              {{ $t('Update') }}
            </VBtn>
          </VForm>
        </VCardText>
      </VCard>
    </VContainer>
  </AdminLayout>
</template>
