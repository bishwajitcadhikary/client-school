<script setup>
import { ref } from 'vue'
import {useForm} from "@inertiajs/inertia-vue3"
import {useSnackbarStore} from "@/Stores/useSnackbarStore"
import TwoFactorAuthentication from "@/Pages/Customer/Profile/TwoFactorAuthentication.vue"

const props = defineProps({
  requiresConfirmation: Boolean,
})
const isCurrentPasswordVisible = ref(false)
const isNewPasswordVisible = ref(false)
const isConfirmPasswordVisible = ref(false)
const passwordRequirements = [
  'Minimum 8 characters long - the more, the better',
]

const passwordForm = useForm({
  _method: "PUT",
  current_password: '',
  password: '',
  password_confirmation: '',
})

const submitPasswordForm = () => {
  passwordForm.post(route('customer.profile.change-password'),{
    preserveScroll: true,
    preserveState: true,
    onSuccess: page => {
      useSnackbarStore().showNotification(page)
      passwordForm.reset()
    },
  })
}
</script>

<template>
  <VRow>
    <!-- SECTION: Change Password -->
    <VCol cols="12">
      <VCard :title="$t('Change Password')">
        <VForm @submit.prevent="submitPasswordForm">
          <VCardText>
            <!-- 👉 Current Password -->
            <VRow class="mb-3">
              <VCol
                cols="12"
                md="6"
              >
                <!-- 👉 current password -->
                <VTextField
                  v-model="passwordForm.current_password"
                  :type="isCurrentPasswordVisible ? 'text' : 'password'"
                  :append-inner-icon="isCurrentPasswordVisible ? 'mdi-eye-off-outline' : 'mdi-eye-outline'"
                  :label="$t('Current Password')"
                  :error-messages="passwordForm.errors.current_password"
                  @click:append-inner="isCurrentPasswordVisible = !isCurrentPasswordVisible"
                />
              </VCol>
            </VRow>

            <!-- 👉 New Password -->
            <VRow>
              <VCol
                cols="12"
                md="6"
              >
                <!-- 👉 new password -->
                <VTextField
                  v-model="passwordForm.password"
                  :type="isNewPasswordVisible ? 'text' : 'password'"
                  :append-inner-icon="isNewPasswordVisible ? 'mdi-eye-off-outline' : 'mdi-eye-outline'"
                  :label="$t('New Password')"
                  :error-messages="passwordForm.errors.password"
                  @click:append-inner="isNewPasswordVisible = !isNewPasswordVisible"
                />
              </VCol>

              <VCol
                cols="12"
                md="6"
              >
                <!-- 👉 confirm password -->
                <VTextField
                  v-model="passwordForm.password_confirmation"
                  :type="isConfirmPasswordVisible ? 'text' : 'password'"
                  :append-inner-icon="isConfirmPasswordVisible ? 'mdi-eye-off-outline' : 'mdi-eye-outline'"
                  :label="$t('Confirm New Password')"
                  :error-messages="passwordForm.errors.password_confirmation"
                  @click:append-inner="isConfirmPasswordVisible = !isConfirmPasswordVisible"
                />
              </VCol>
            </VRow>
          </VCardText>

          <!-- 👉 Password Requirements -->
          <VCardText>
            <p class="text-base font-weight-medium mt-2">
              {{ $t('Password Requirements:') }}
            </p>

            <ul class="d-flex flex-column gap-y-3">
              <li
                v-for="item in passwordRequirements"
                :key="item"
                class="d-flex"
              >
                <div>
                  <VIcon
                    size="7"
                    icon="mdi-circle"
                    class="me-3"
                  />
                </div>
                <span class="font-weight-medium">{{ item }}</span>
              </li>
            </ul>
          </VCardText>

          <!-- 👉 Action Buttons -->
          <VCardText class="d-flex flex-wrap gap-4">
            <VBtn
              :loading="passwordForm.processing"
              type="submit"
            >
              {{ $t('Change Password') }}
            </VBtn>

            <VBtn
              type="reset"
              color="secondary"
              variant="tonal"
              @click="passwordForm.reset()"
            >
              {{ $t('Reset') }}
            </VBtn>
          </VCardText>
        </VForm>
      </VCard>
    </VCol>
    <!-- !SECTION -->

    <!-- SECTION Two-steps verification -->
    <!--    <TwoFactorAuthentication :requires-confirmation="requiresConfirmation" /> -->
    <!-- !SECTION -->
  </VRow>
</template>
