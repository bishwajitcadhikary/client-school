<script setup>
import {useTheme} from 'vuetify'
import logo from '@/assets/logo.svg?raw'
import AuthProvider from './AuthProvider.vue'
import authV1MaskDark from '@/assets/images/pages/auth-v1-mask-dark.png'
import authV1MaskLight from '@/assets/images/pages/auth-v1-mask-light.png'
import authV1Tree2 from '@/assets/images/pages/auth-v1-tree-2.png'
import authV1Tree from '@/assets/images/pages/auth-v1-tree.png'
import {useForm} from "@inertiajs/inertia-vue3";
import {computed, onMounted, ref} from "vue";
import { useReCaptcha } from "vue-recaptcha-v3";

const { executeRecaptcha, recaptchaLoaded } = useReCaptcha();

const recaptcha = async () => {
  // (optional) Wait until recaptcha has been loaded.
  await recaptchaLoaded();

  // Execute reCAPTCHA with action "login".
  form.token = await executeRecaptcha("login");
};

onMounted(() => {
  recaptcha()
})

computed(() => {

})

const form = useForm({
  name: '',
  email: '',
  password: '',
  password_confirmation: '',
  terms: false,
  token: ''
})
const vuetifyTheme = useTheme()
const authThemeMask = computed(() => {
  return vuetifyTheme.global.name.value === 'light' ? authV1MaskLight : authV1MaskDark
})
const isPasswordVisible = ref(false)

const submit = () => {
  form.post(route('register'), {
    preserveScroll: true,
    preserveState: true,
    onFinish: () => form.reset('password', 'password_confirmation'),
  });
};
</script>

<template>
  <div class="auth-wrapper d-flex align-center justify-center pa-4">
    <VCard
      class="auth-card pa-4 pt-7"
      max-width="448"
    >
      <VCardItem class="justify-center">
        <template #prepend>
          <div class="d-flex">
            <div v-html="logo"/>
          </div>
        </template>

        <VCardTitle class="font-weight-semibold text-2xl text-uppercase">
          {{ $page.props.app.name }}
        </VCardTitle>
      </VCardItem>

      <VCardText class="pt-2">
        <h5 class="text-h5 font-weight-semibold mb-1">
          {{ $t('Adventure starts here') }}
        </h5>
        <p class="mb-0">
          {{ $t('Make your app management easy and fun!') }}
        </p>
      </VCardText>

      <VCardText>
        <VForm @submit.prevent="submit">
          <VRow>
            <!-- Name -->
            <VCol cols="12">
              <VTextField
                v-model="form.name"
                :label="$t('Name')"
                :error-message="form.errors.name"
                required
              />
            </VCol>
            <!-- email -->
            <VCol cols="12">
              <VTextField
                v-model="form.email"
                :label="$t('Email')"
                type="email"
                :error-messages="form.errors.email"
                required
              />
            </VCol>

            <!-- password -->
            <VCol cols="12">
              <VTextField
                v-model="form.password"
                :label="$t('Password')"
                :type="isPasswordVisible ? 'text' : 'password'"
                :append-inner-icon="isPasswordVisible ? 'mdi-eye-off-outline' : 'mdi-eye-outline'"
                @click:append-inner="isPasswordVisible = !isPasswordVisible"
                :error-messages="form.errors.password"
                min="8"
                required
              />
            </VCol>
            <VCol cols="12">
              <VTextField
                v-model="form.password_confirmation"
                :label="$t('Confirm Password')"
                :type="isPasswordVisible ? 'text' : 'password'"
                :append-inner-icon="isPasswordVisible ? 'mdi-eye-off-outline' : 'mdi-eye-outline'"
                @click:append-inner="isPasswordVisible = !isPasswordVisible"
                :error-messages="form.errors.password_confirmation"
                min="8"
                required
              />

              <div class="d-flex align-center mt-1 mb-4">
                <VCheckbox
                  id="terms"
                  v-model="form.terms"
                  inline
                  :error-messages="form.errors.terms"
                />
                <VLabel
                  for="terms"
                  style="opacity: 1;"
                >
                  <span class="me-1">{{ $t('I agree to') }}</span>
                  <a
                    href="javascript:void(0)"
                    class="text-primary"
                  >{{ $t('privacy policy & terms') }}</a>
                </VLabel>
              </div>
            </VCol>

            <VCol cols="12">

              <VBtn
                :loading="form.processing"
                type="submit"
                block
              >
                {{ $t('Sign up') }}
              </VBtn>
            </VCol>

            <!-- login instead -->
            <VCol
              cols="12"
              class="text-center text-base"
            >
              <span>{{ $t('Already have an account?') }}</span>
              <Link
                class="text-primary ms-2"
                :href="route('login')"
              >
                {{ $t('Sign in instead') }}
              </Link>
            </VCol>

            <VCol
              cols="12"
              class="d-flex align-center"
            >
              <VDivider/>
              <span class="mx-4">{{ $t('or') }}</span>
              <VDivider/>
            </VCol>

            <!-- auth providers -->
            <VCol
              cols="12"
              class="text-center"
            >
              <AuthProvider/>
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
