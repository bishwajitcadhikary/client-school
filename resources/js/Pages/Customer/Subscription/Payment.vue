<script setup>
import {ref} from 'vue'
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
  interval: !!props.interval ? 'monthly' : 'yearly',
})

const submit = () => {
  form.post(route('customer.subscription.payment.store', {plan: props.plan.id}), {
    preserveScroll: true,
    preserveState: true,
    onSuccess: page => {
      useSnackbarStore().showNotification(page)
      form.reset()
    },
  })
}

const showInstruction = ref(false)
const instructions = ref(null)
const showPaymentInstruction = () => {
  showInstruction.value = true
  instructions.value = props.gateways.find(gateway => gateway.value === form.gateway)?.instructions
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
              <VForm @submit.prevent="submit">
                <VSelect
                  v-model="form.gateway"
                  :label="$t('Payment Gateway')"
                  :items="gateways"
                  :error-messages="form.errors.gateway"
                  class="mb-5"
                  @update:modelValue="showPaymentInstruction"
                />

                <VCardText v-if="showInstruction">
                  {{ instructions }}
                </VCardText>

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
