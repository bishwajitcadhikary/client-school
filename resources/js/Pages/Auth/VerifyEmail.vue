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
  status: String,
})

const form = useForm()

const isPasswordVisible = ref(false)
const vuetifyTheme = useTheme()
const authThemeMask = computed(() => {
  return vuetifyTheme.global.name.value === 'light' ? authV1MaskLight : authV1MaskDark
})

const submit = () => {
  form.post(route('verification.send'), {
    preserveState: true,
    preserveScroll: true,
  })
}

const verificationLinkSent = computed(() => props.status === 'verification-link-sent')
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
          {{ $t('Verify Email') }}
        </h5>
        <p class="mb-0">
          {{ $t('Thanks for signing up! Before getting started, could you verify your email address by clicking on the link we just emailed to you? If you didn\'t receive the email, we will gladly send you another.') }}
        </p>

        <VAlert
          v-if="verificationLinkSent"
          type="success"
          class="mt-3"
          dense
          text
        >
          {{ $t('A new verification link has been sent to the email address you provided during registration.') }}
        </VAlert>
      </VCardText>

      <VCardText>
        <VForm @submit.prevent="submit">
          <VRow>
            <VCol cols="12">
              <VBtn
                :loading="form.processing"
                type="submit"
                block
              >
                {{ $t('Resend Verification Email') }}
              </VBtn>
            </VCol>

            <!-- create account -->
            <VCol
              cols="12"
              class="text-center text-base"
            >
              <Link
                class="text-primary ms-2"
                :href="route('logout')"
                method="post"
                as="button"
              >
                {{ $t('Logout') }}
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
