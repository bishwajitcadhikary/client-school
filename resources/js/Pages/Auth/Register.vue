<script setup>
import {useTheme} from 'vuetify'
import logo from '@/assets/logo.jpg'
import AuthProvider from './AuthProvider.vue'
import authV1MaskDark from '@/assets/images/pages/auth-v1-mask-dark.png'
import authV1MaskLight from '@/assets/images/pages/auth-v1-mask-light.png'
import authV1Tree2 from '@/assets/images/pages/auth-v1-tree-2.png'
import authV1Tree from '@/assets/images/pages/auth-v1-tree.png'
import {useForm} from "@inertiajs/inertia-vue3"
import {computed, ref} from "vue"

const props = defineProps({
  showRecaptcha: {
    type: Boolean,
    default: false,
  },
  recaptchaSiteKey: {
    type: String,
    default: null,
  },
})

const isValid = ref(false)
const form = useForm({
  name: null,
  phone: null,
  email: null,
  password: null,
  password_confirmation: null,
  terms: false,
  recaptcha: null,
})
const vuetifyTheme = useTheme()
const authThemeMask = computed(() => {
  return vuetifyTheme.global.name.value === 'light' ? authV1MaskLight : authV1MaskDark
})
const isPasswordVisible = ref(false)
const vueRecaptchaRef = ref()

const submit = () => {
  form.post(route('register'), {
    preserveScroll: true,
    preserveState: true,
    onFinish: () => form.reset('password', 'password_confirmation'),
  })
}

const recaptchaVerified = function (response) {
  form.recaptcha = response
  form.errors.recaptcha = null
}
const recaptchaExpired = function () {
  form.recaptcha = null
  vueRecaptchaRef.value.reset()
}
const recaptchaFailed = function () {
  form.recaptcha = null
  vueRecaptchaRef.value.reset()
}
</script>

<script>
import vueRecaptcha from 'vue3-recaptcha2'
export default {
  components: {
    VueRecaptcha: vueRecaptcha,
  },
}
</script>

<template>
  <Head :title="$t('Register')" />
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
      </VCardItem>

      <VCardText class="pt-2">
        <h5 class="text-h5 font-weight-semibold mb-1">
          {{ $t('Adventure starts here') }}
        </h5>
        <p class="mb-0">
          {{ $t('Make your school management easy and fun!') }}
        </p>
      </VCardText>

      <VCardText>
        <VForm
          v-model="isValid"
          @submit.prevent="submit"
        >
          <VRow>
            <!-- Name -->
            <VCol cols="12">
              <VTextField
                v-model="form.name"
                :label="$t('Name')"
                :error-message="form.errors.name"
                :rules="[v => !!v || $t('Name is required')]"
                required
              />
            </VCol>
            <!-- Phone -->
            <VCol cols="12">
              <VTextField
                v-model="form.phone"
                :label="$t('Phone')"
                :error-message="form.errors.phone"
                :rules="[v => !!v || $t('Phone is required')]"
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
                :rules="[v => !!v || $t('Email is required'), v => /.+@.+\..+/.test(v) || $t('Email must be valid'), v => v.length <= 255 || $t('Email must be less than 255 characters')]"
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
                :error-messages="form.errors.password"
                :rules="[v => !!v || $t('Password is required'), v => v.length >= 8 || $t('Password must be at least 8 characters'), v => v.length <= 255]"
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
              <VueRecaptcha
                v-show="showRecaptcha"
                ref="vueRecaptchaRef"
                :sitekey="recaptchaSiteKey"
                size="normal"
                theme="light"
                class="g-recaptcha"
                @verify="recaptchaVerified"
                @expire="recaptchaExpired"
                @fail="recaptchaFailed"
              />
              <p
                v-if="form.errors.recaptcha"
                class="text-error"
              >
                {{ form.errors.recaptcha }}
              </p>
            </VCol>

            <VCol cols="12">
              <div class="d-flex align-center">
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
                :disabled="!form.isDirty && isValid"
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
              <VDivider />
              <span class="mx-4">{{ $t('or') }}</span>
              <VDivider />
            </VCol>

            <!-- auth providers -->
            <VCol
              cols="12"
              class="text-center"
            >
              <AuthProvider />
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
