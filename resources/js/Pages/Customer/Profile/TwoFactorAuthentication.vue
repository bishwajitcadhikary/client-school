<script setup>
import { ref, computed, watch } from 'vue'
import {useForm, usePage} from "@inertiajs/inertia-vue3"
import {Inertia} from "@inertiajs/inertia"
import ConfirmsPassword from "./ConfirmsPassowrd.vue"

const props = defineProps({
  requiresConfirmation: Boolean,
})

const enabling = ref(false)
const confirming = ref(false)
const disabling = ref(false)
const qrCode = ref(null)
const setupKey = ref(null)
const recoveryCodes = ref([])

const confirmationForm = useForm({
  code: '',
})

const twoFactorEnabled = computed(
  () => ! enabling.value && usePage().props.value.auth?.user?.two_factor_enabled,
)

watch(twoFactorEnabled, () => {
  if (! twoFactorEnabled.value) {
    confirmationForm.reset()
    confirmationForm.clearErrors()
  }
})

const enableTwoFactorAuthentication = () => {
  enabling.value = true

  Inertia.post('/user/two-factor-authentication', {}, {
    preserveScroll: true,
    onSuccess: page => Promise.all([
      showQrCode(),
      showSetupKey(),
      showRecoveryCodes(),
    ]),
    onFinish: () => {
      enabling.value = false
      confirming.value = props.requiresConfirmation
    },
  })
}

const showQrCode = () => {
  return axios.get('/user/two-factor-qr-code').then(response => {
    qrCode.value = response.data.svg
  })
}

const showSetupKey = () => {
  return axios.get('/user/two-factor-secret-key').then(response => {
    setupKey.value = response.data.secretKey
  })
}

const showRecoveryCodes = () => {
  return axios.get('/user/two-factor-recovery-codes').then(response => {
    recoveryCodes.value = response.data
  })
}

const confirmTwoFactorAuthentication = () => {
  confirmationForm.post('/user/confirmed-two-factor-authentication', {
    errorBag: "confirmTwoFactorAuthentication",
    preserveScroll: true,
    preserveState: true,
    onSuccess: () => {
      confirming.value = false
      qrCode.value = null
      setupKey.value = null
    },
  })
}

const regenerateRecoveryCodes = () => {
  axios
    .post('/user/two-factor-recovery-codes')
    .then(() => showRecoveryCodes())
}

const disableTwoFactorAuthentication = () => {
  disabling.value = true

  Inertia.delete('/user/two-factor-authentication', {
    preserveScroll: true,
    onSuccess: () => {
      disabling.value = false
      confirming.value = false
    },
  })
}
</script>

<template>
  <!-- SECTION Two-steps verification -->
  <VCol cols="12">
    <VCard :title="$t('Two-steps verification')">
      <VCardText>
        <p
          v-if="twoFactorEnabled && ! confirming"
          class="font-weight-semibold"
        >
          You have enabled two factor authentication.
        </p>

        <p
          v-else-if="twoFactorEnabled && confirming"
          class="font-weight-semibold"
        >
          Finish enabling two factor authentication.
        </p>

        <p
          v-else
          class="font-weight-semibold"
        >
          You have not enabled two factor authentication.
        </p>

        <div class="mt-3">
          <p>
            When two factor authentication is enabled, you will be prompted for a secure, random token during authentication. You may retrieve this token from your phone's Google Authenticator application.
          </p>
        </div>

        <div v-if="twoFactorEnabled">
          <div v-if="qrCode">
            <div class="mt-4 max-w-xl text-sm text-gray-600">
              <p
                v-if="confirming"
                class="font-semibold"
              >
                {{ $t('To finish enabling two factor authentication, scan the following QR code using your phone\'s authenticator application or enter the setup key and provide the generated OTP code.') }}
              </p>

              <p v-else>
                {{ $t('Two factor authentication is now enabled. Scan the following QR code using your phone\'s authenticator application or enter the setup key.') }}
              </p>
            </div>

            <div
              class="mt-4"
              v-html="qrCode"
            />

            <div
              v-if="setupKey"
              class="mt-4 max-w-xl text-sm text-gray-600"
            >
              <p class="font-semibold">
                Setup Key: <span v-html="setupKey" />
              </p>
            </div>

            <div
              v-if="confirming"
              class="mt-4"
            >
              <VTextField
                v-model="confirmationForm.code"
                type="text"
                name="code"
                class="block mt-1 w-1/2"
                inputmode="numeric"
                autofocus
                autocomplete="one-time-code"
                :error-messages="confirmationForm.errors.code"
                @keyup.enter="confirmTwoFactorAuthentication"
              />
            </div>
          </div>

          <div v-if="recoveryCodes.length > 0 && ! confirming">
            <div class="mt-4 max-w-xl text-sm text-gray-600">
              <p class="font-semibold">
                Store these recovery codes in a secure password manager. They can be used to recover access to your account if your two factor authentication device is lost.
              </p>
            </div>

            <div class="grid gap-1 max-w-xl mt-4 px-4 py-4 font-mono text-sm bg-gray-100 rounded-lg">
              <div
                v-for="code in recoveryCodes"
                :key="code"
              >
                {{ code }}
              </div>
            </div>
          </div>
        </div>

        <div class="mt-5">
          <div v-if="! twoFactorEnabled">
            <ConfirmsPassword @confirmed="enableTwoFactorAuthentication">
              <VBtn
                type="button"
                :class="{ 'opacity-25': enabling }"
                :disabled="enabling"
              >
                {{ $t('Enable') }}
              </VBtn>
            </ConfirmsPassword>
          </div>

          <div v-else>
            <ConfirmsPassword @confirmed="confirmTwoFactorAuthentication">
              <VBtn
                v-if="confirming"
                type="button"
                class="mr-3"
                :class="{ 'opacity-25': enabling }"
                :disabled="enabling"
              >
                {{ $t('Confirm') }}
              </VBtn>
            </ConfirmsPassword>

            <ConfirmsPassword @confirmed="regenerateRecoveryCodes">
              <VBtn
                v-if="recoveryCodes.length > 0 && ! confirming"
                color="secondary"
                class="mr-3"
              >
                {{ $t('Regenerate Recovery Codes') }}
              </VBtn>
            </ConfirmsPassword>

            <ConfirmsPassword @confirmed="showRecoveryCodes">
              <VBtn
                v-if="recoveryCodes.length === 0 && ! confirming"
                color="secondary"
                class="mr-3"
              >
                Show Recovery Codes
              </VBtn>
            </ConfirmsPassword>

            <ConfirmsPassword @confirmed="disableTwoFactorAuthentication">
              <VBtn
                v-if="confirming"
                color="secondary"
                :class="{ 'opacity-25': disabling }"
                :disabled="disabling"
              >
                {{ $t('Cancel') }}
              </VBtn>
            </ConfirmsPassword>

            <ConfirmsPassword @confirmed="disableTwoFactorAuthentication">
              <VBtn
                v-if="! confirming"
                color="error"
                :class="{ 'opacity-25': disabling }"
                :disabled="disabling"
              >
                {{ $t('Disable') }}
              </VBtn>
            </ConfirmsPassword>
          </div>
        </div>
      </VCardText>
    </VCard>
  </VCol>
  <!-- !SECTION -->
</template>
