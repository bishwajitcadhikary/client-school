<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import rules from '@/plugins/rules'
import {inject} from "vue"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  currencies: {
    type: Object,
    default: null,
  },
  gateway: {
    type: Object,
    default: null,
  },
})

const snackbarStore = useSnackbarStore()
const form = useForm({
  _method: 'PUT',
  name: props.gateway.name,
  logo: null,
  currency: props.gateway.currency_id,
  charge: props.gateway.charge,
  is_active: !!props.gateway.is_active,
  instructions: props.gateway.instructions,
})

const currencyForm = useForm({
  code: props.gateway.currency.code,
  rate: props.gateway.currency.rate,
  symbol: props.gateway.currency.symbol,
})

function submit() {
  form.post(route('admin.settings.gateways.update', {gateway: props.gateway.id}),{
    onSuccess: page => {
      snackbarStore.showNotification(page)
    },
  })
}

function selectLogo(e) {
  if (e.length > 0){
    form.logo = e[0]
  }else {
    form.logo = null
  }
}

function selectCurrency(e) {
  currencyForm.code = props.currencies.find(c => c.value == e)?.code
  currencyForm.rate = props.currencies.find(c => c.value == e)?.rate
  currencyForm.symbol = props.currencies.find(c => c.value == e)?.symbol
}
</script>

<template>
  <AppLayout
    :title="$t('Edit Gateway')"
    :back="route('admin.settings.gateways.index')"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>
    <VContainer>
      <VRow>
        <VCol
          cols="12"
          sm="8"
        >
          <VCard>
            <VCardTitle>{{ $t('Edit Gateway') }}</VCardTitle>
            <VCardSubtitle>{{ $t('Here you can edit payment gateway') }}</VCardSubtitle>
            <VCardText>
              <VForm @submit.prevent="submit">
                <VTextField
                  v-model="form.name"
                  class="mb-5"
                  :label="$t('Gateway Name')"
                  :rules="[rules.required]"
                />

                <VFileInput
                  class="mb-5"
                  accept="image/png, image/jpeg, image/jpg"
                  :label="$t('Logo')"
                  :placeholder="$t('Pick gateway logo')"
                  :error-messages="form.errors.logo"
                  @update:modelValue="selectLogo"
                />

                <VSelect
                  v-model="form.currency"
                  class="mb-5"
                  :label="$t('Currency')"
                  :items="currencies"
                  :rules="[rules.required]"
                  :error-messages="form.errors.currency"
                  @update:modelValue="selectCurrency"
                />

                <VTextField
                  v-model="currencyForm.code"
                  class="mb-5"
                  :label="$t('Currency Code')"
                  disabled
                />

                <VTextField
                  v-model="currencyForm.rate"
                  class="mb-5"
                  :prefix="currencyForm.symbol"
                  :label="$t('Currency Rate')"
                  disabled
                />

                <VTextField
                  v-model="form.charge"
                  type="number"
                  class="mb-5"
                  :prefix="currencyForm.symbol"
                  :label="$t('Gateway Charge')"
                  :error-messages="form.errors.charge"
                />

                <VTextarea
                  v-model="form.instructions"
                  class="mb-5"
                  :label="$t('Payment Instructions')"
                  :error-messages="form.errors.instructions"
                />

                <VSwitch
                  v-model="form.is_active"
                  class="mb-5"
                  :label="$t('Active')"
                  :error-messages="form.errors.is_active"
                />

                <VBtn
                  type="submit"
                  :loading="form.processing"
                >
                  <VIcon icon="mdi-content-save" />
                  {{ $t('Save') }}
                </VBtn>
              </VForm>
            </VCardText>
          </VCard>
        </VCol>
      </VRow>
    </VContainer>
  </AppLayout>
</template>
