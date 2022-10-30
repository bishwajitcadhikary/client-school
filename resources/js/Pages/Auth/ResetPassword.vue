<script setup>
import {computed, ref} from 'vue'
import { useTheme } from 'vuetify'
import logo from '@/assets/logo.jpg'
import AuthProvider from './AuthProvider.vue'
import authV1MaskDark from '@/assets/images/pages/auth-v1-mask-dark.png'
import authV1MaskLight from '@/assets/images/pages/auth-v1-mask-light.png'
import authV1Tree2 from '@/assets/images/pages/auth-v1-tree-2.png'
import authV1Tree from '@/assets/images/pages/auth-v1-tree.png'
import {useForm} from "@inertiajs/inertia-vue3"

const props = defineProps({
  email: String,
  token: String,
})

const form = useForm({
  token: props.token,
  email: props.email,
  password: '',
  password_confirmation: '',
})

const isPasswordVisible = ref(false)
const vuetifyTheme = useTheme()
const authThemeMask = computed(() => {
  return vuetifyTheme.global.name.value === 'light' ? authV1MaskLight : authV1MaskDark
})

const submit = () => {
  form.post(route('password.update'), {
    onFinish: () => form.reset('password', 'password_confirmation'),
  })
}
</script>

<template>
  <Head :title="$t('Forgot Password')" />
  <div class="auth-wrapper d-flex align-center justify-center pa-4">
    <VCard
      class="auth-card pa-4 pt-7"
      max-width="448"
    >
      <VCardItem class="justify-center">
        <template #prepend>
          <div class="d-flex">
            <img
              :src="logo"
              class="w-100"
            >
          </div>
        </template>

        <VCardTitle class="font-weight-semibold text-2xl text-uppercase">
          {{ $page.props.app.name }}
        </VCardTitle>
      </VCardItem>

      <VCardText class="pt-2">
        <h5 class="text-h5 font-weight-semibold mb-1">
          {{ $t('Reset Password') }}
        </h5>
      </VCardText>

      <VCardText>
        <VForm @submit.prevent="submit">
          <VRow>
            <VCol cols="12">
              <VTextField
                v-model="form.email"
                :label="$t('Email')"
                type="email"
                :error-messages="form.errors.email"
                required
                disabled
              />
            </VCol>

            <VCol cols="12">
              <VTextField
                v-model="form.password"
                :label="$t('Password')"
                :type="isPasswordVisible ? 'text' : 'password'"
                :append-inner-icon="isPasswordVisible ? 'mdi-eye-off-outline' : 'mdi-eye-outline'"
                :error-messages="form.errors.password"
                min="8"
                required
                @click:append-inner="isPasswordVisible = !isPasswordVisible"
              />
            </VCol>
            <VCol cols="12">
              <VTextField
                v-model="form.password_confirmation"
                :label="$t('Confirm Password')"
                :type="isPasswordVisible ? 'text' : 'password'"
                :append-inner-icon="isPasswordVisible ? 'mdi-eye-off-outline' : 'mdi-eye-outline'"
                :error-messages="form.errors.password_confirmation"
                min="8"
                required
                @click:append-inner="isPasswordVisible = !isPasswordVisible"
              />
            </VCol>
            <VCol cols="12">
              <VBtn
                :loading="form.processing"
                type="submit"
                block
              >
                {{ $t('Reset Password') }}
              </VBtn>
            </VCol>

            <!-- create account -->
            <VCol
              cols="12"
              class="text-center text-base"
            >
              <span>{{ $t('Remember your credentials?') }}</span>
              <Link
                class="text-primary ms-2"
                :href="route('login')"
              >
                {{ $t('Login') }}
              </Link>
            </VCol>
          </VRow>
        </VForm>
      </VCardText>
    </VCard>

    <VImg
      class="auth-footer-start-tree d-none d-md-block"
      :src="authV1Tree"
      :width="250"
    />

    <VImg
      :src="authV1Tree2"
      class="auth-footer-end-tree d-none d-md-block"
      :width="350"
    />

    <!-- bg img -->
    <VImg
      class="auth-footer-mask d-none d-md-block"
      :src="authThemeMask"
    />
  </div>
</template>

<style lang="scss">
@use "@core/scss/pages/page-auth.scss";
</style>
