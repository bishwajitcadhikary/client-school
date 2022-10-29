<script setup>
import { ref, reactive, nextTick } from 'vue'

defineProps({
  title: {
    type: String,
    default: 'Confirm Password',
  },
  content: {
    type: String,
    default: 'For your security, please confirm your password to continue.',
  },
  button: {
    type: String,
    default: 'Confirm',
  },
})

const emit = defineEmits(['confirmed'])

const confirmingPassword = ref(false)

const form = reactive({
  password: '',
  error: '',
  processing: false,
})

const passwordInput = ref(null)

const startConfirmingPassword = () => {
  axios.get(route('password.confirmation')).then(response => {
    if (response.data.confirmed) {
      emit('confirmed')
    } else {
      confirmingPassword.value = true

      setTimeout(() => passwordInput.value.focus(), 250)
    }
  })
}

const confirmPassword = () => {
  form.processing = true

  axios.post(route('password.confirm'), {
    password: form.password,
  }).then(() => {
    form.processing = false

    closeModal()
    nextTick().then(() => emit('confirmed'))

  }).catch(error => {
    form.processing = false
    form.error = error.response.data.errors.password[0]
    passwordInput.value.focus()
  })
}

const closeModal = () => {
  confirmingPassword.value = false
  form.password = ''
  form.error = ''
}
</script>

<template>
  <span>
    <span @click="startConfirmingPassword">
      <slot />
    </span>
  </span>


  <VDialog
    v-model="confirmingPassword"
    @close="closeModal"
  >
    <VCard>
      <VCardTitle class="text-h5">
        {{ title }}
      </VCardTitle>
      <VCardSubtitle>{{ content }}</VCardSubtitle>

      <VCardText>
        <VTextField
          ref="passwordInput"
          v-model="form.password"
          type="password"
          class="mt-1 block w-3/4"
          :label="$t('Password')"
          :error-messages="form.error"
          @keyup.enter="confirmPassword"
        />
      </VCardText>
      <VCardActions>
        <VSpacer />
        <VBtn @click="closeModal">
          {{ $t('Cancel') }}
        </VBtn>

        <VBtn
          class="ml-3"
          :class="{ 'opacity-25': form.processing }"
          :disabled="form.processing"
          @click="confirmPassword"
        >
          {{ button }}
        </VBtn>
      </VCardActions>
    </VCard>
  </VDialog>
</template>
