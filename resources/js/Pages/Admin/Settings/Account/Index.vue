<script setup>
import {computed, inject, provide, ref} from "vue"
import rules from "@/plugins/rules"
import {useForm} from "@inertiajs/inertia-vue3"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  languages: {
    type: Object,
    default: null,
  },
  user: {
    type: Object,
    required: true,
  },
})

const snackbarStore = useSnackbarStore()

const showPassword = ref(false)
const showConfirmPassword = ref(false)

const form = useForm({
  _method: 'PUT',
  name: props.user.name,
  email: props.user.email,
  password: null,
  password_confirmation: null,
  language: props.user.language_id,
})

function submit() {
  form.post(route('admin.settings.account-settings.update'), {
    onSuccess: page => {
      snackbarStore.showNotification(page)
    },
  })
}
</script>

<template>
  <AdminLayout
    :title="$t('Account Settings')"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>

    <VContainer>
      <VCard>
        <VCardTitle>{{ $t('Account Settings') }}</VCardTitle>
        <VCardSubtitle>{{ $t('You can update your name, email & password using the form below.') }}</VCardSubtitle>
        <VCardText>
          <VForm @submit.prevent="submit">
            <VRow>
              <VCol
                cols="12"
                sm="6"
              >
                <VTextField
                  v-model="form.name"
                  :label="$t('Name')"
                  :rules="[rules.required]"
                  :error-messages="form.errors.name"
                />
              </VCol>
              <VCol
                cols="12"
                sm="6"
              >
                <VTextField
                  v-model="form.email"
                  :label="$t('Email')"
                  :rules="[rules.required, rules.email]"
                  :error-messages="form.errors.email"
                />
              </VCol>
              <VCol
                cols="12"
                sm="6"
              >
                <VTextField
                  v-model="form.password"
                  :label="$t('Password')"
                  :error-messages="form.errors.password"
                  :append-inner-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
                  :type="showPassword ? 'text' : 'password'"
                  @click:append-inner="showPassword = !showPassword"
                />
              </VCol>
              <VCol
                cols="12"
                sm="6"
              >
                <VTextField
                  v-model="form.password_confirmation"
                  :label="$t('Confirm Password')"
                  :error-messages="form.errors.password_confirmation"
                  :append-inner-icon="showConfirmPassword ? 'mdi-eye' : 'mdi-eye-off'"
                  :type="showConfirmPassword ? 'text' : 'password'"
                  @click:append-inner="showConfirmPassword = !showConfirmPassword"
                />
              </VCol>
              <VCol
                cols="12"
                sm="6"
              >
                <VSelect
                  v-model="form.language"
                  :label="$t('Language')"
                  :error-messages="form.errors.language"
                  :items="languages"
                />
              </VCol>

              <VCol cols="12">
                <VBtn
                  type="submit"
                  :loading="form.processing"
                >
                  <VIcon icon="mdi-content-save" />
                  {{ $t('Save') }}
                </VBtn>
              </VCol>
            </VRow>
          </VForm>
        </VCardText>
      </VCard>
    </VContainer>
  </AdminLayout>
</template>
