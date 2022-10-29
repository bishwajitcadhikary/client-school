<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  gateways: {
    type: Object,
    required: true,
  },
  plan:{
    type: Object,
    default: null,
  },
  interval:{
    type: Boolean,
    default: false,
  },
})

const form = useForm({
  trx_id: null,
  description: null,
  gateway: null,
  screenshot: null,
  interval: !!props.interval ? 'monthly' : 'yearly',
})

const screenshotAdded = file => {
  form.screenshot = file[0]
  console.log(file[0])
}

const submit = () => {
  form.post(route('customer.subscription.payment.store'), {
    preserveScroll: true,
    preserveState: true,
    onSuccess: () => {
      useSnackbarStore().showNotification(page)
      form.reset()
    },
  })
}
</script>

<template>
  <AppLayout :title="$t('Payment')">
    <VContainer>
      <VRow justify="center">
        <VCol
          cols="12"
          md="8"
        >
          <VCard>
            <VCardText>
              <VForm>
                <VSelect
                  v-model="form.gateway"
                  :label="$t('Payment Gateway')"
                  :items="gateways"
                  :error-messages="form.errors.gateway"
                  class="mb-5"
                />
                <VFileInput
                  class="mb-5"
                  prepend-icon="mdi-camera"
                  @update:modelValue="screenshotAdded"
                >
                  <template #label>
                    {{ $t('Transaction Screenshot') }}
                  </template>
                  <template #message>
                    {{ $t('Please upload your transaction ID') }}
                  </template>
                </VFileInput>
                <VTextField
                  v-model="form.trx_id"
                  :label="$t('Transaction ID')"
                  outlined
                  dense
                  :error-messages="form.errors.trx_id"
                  class="mb-5"
                />
                <VTextarea
                  v-model="form.description"
                  :label="$t('Description')"
                  rows="3"
                  outlined
                  dense
                  :error-messages="form.errors.description"
                  class="mb-5"
                />

                <VBtn
                  type="submit"
                  :loading="form.processing"
                >
                  {{ $t('Submit') }}
                </VBtn>
              </VForm>
            </VCardText>
          </VCard>
        </VCol>
      </VRow>
    </VContainer>
  </AppLayout>
</template>
