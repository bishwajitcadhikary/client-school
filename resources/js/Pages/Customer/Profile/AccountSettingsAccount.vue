<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import rules from '@/plugins/rules'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"
import {trans} from "laravel-vue-i18n"

// Import FilePond
import vueFilePond from 'vue-filepond'

// Import plugins
import FilePondPluginFileValidateType from 'filepond-plugin-file-validate-type'
import FilePondPluginImagePreview from 'filepond-plugin-image-preview'
import FilePondPluginImageCrop from 'filepond-plugin-image-crop'
import FilePondPluginImageExifOrientation from 'filepond-plugin-image-exif-orientation'
import FilePondPluginImageValidateSize from 'filepond-plugin-image-validate-size'
import FilePondPluginImageResize from 'filepond-plugin-image-resize'
import FilePondPluginFileValidateSize from 'filepond-plugin-file-validate-size'


// Import styles
import 'filepond/dist/filepond.min.css'
import 'filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css'
import {Inertia} from "@inertiajs/inertia"

const props = defineProps({
  customer: {
    type: Object,
    required: true,
  },
  languages: {
    type: [Array, Object],
    required: true,
  },
  countries: {
    type: [Array, Object],
    required: true,
  },
  currencies: {
    type: [Array, Object],
    required: true,
  },
  timeZones: {
    type: [Array, Object],
    required: true,
  },
})


// Create FilePond component
const FilePond = vueFilePond(
  FilePondPluginFileValidateType,
  FilePondPluginImagePreview,
  FilePondPluginImageCrop,
  FilePondPluginImageExifOrientation,
  FilePondPluginImageValidateSize,
  FilePondPluginImageResize,
  FilePondPluginFileValidateSize,
)


const form = useForm({
  _method: 'PUT',
  avatar: null,
  name: props.customer.name,
  email: props.customer.email,
  username: props.customer.username,
  phone: props.customer.phone,
  website: props.customer.website,
  language: props.customer.language_id,
  country: props.customer.country,
  currency: props.customer.currency_id,
  timezone: props.customer.timezone,
})

const isAccountDeactivated = ref(false)
const confirmPassword = ref(null)
const validateAccountDeactivation = [v => !!v || 'Please confirm account deactivation']

function addAvatar(error, file) {
  if (error){
    snackbarStore.showSnackbar(trans('Something went wrong'))
  }else {
    form.avatar = file.file
  }
}

function updateProfileInformation() {
  form.post(route('customer.profile.update-profile-information'), {
    preserveScroll: true,
    preserveState: true,
    onSuccess: page => {
      useSnackbarStore().showNotification(page)
    },
  })
}

function deactivateAccount() {
  Inertia.post(route('customer.profile.deactivate-account'), {
    _method: 'PUT',
    deactivation_confirmation: isAccountDeactivated.value,
    confirm_password: confirmPassword.value,
  },{
    preserveScroll: true,
    preserveState: true,
    onSuccess: page => {
      useSnackbarStore().showNotification(page)
    },
  })
}
</script>

<template>
  <VRow>
    <VCol cols="12">
      <VCard :title="$t('Account Details')">
        <VCardText>
          <!-- 👉 Form -->
          <VForm
            class="mt-6"
            @submit.prevent="updateProfileInformation"
          >
            <VRow>
              <!-- 👉 Avatar -->
              <VCol
                cols="12"
                lg="4"
                md="4"
              >
                <FilePond
                  :credits="false"
                  :label-idle="$t('Browse')"
                  image-crop-aspect-ratio="1:1"
                  image-validate-size-min-width="50"
                  image-validate-size-min-height="50"
                  max-file-size="1MB"
                  min-file-size="10KB"
                  accepted-file-types="image/jpeg, image/png, image/jpg"
                  :files="customer.avatar"
                  @addfile="addAvatar"
                  @removefile="form.avatar = null"
                />
                <p
                  v-if="form.errors.avatar"
                  class="text-error"
                >
                  {{ form.errors.avatar }}
                </p>
              </VCol>
            </VRow>
            <VRow>
              <!-- 👉 First Name -->
              <VCol
                md="6"
                cols="12"
              >
                <VTextField
                  v-model="form.name"
                  :label="$t('Name')"
                  :rules="[rules.required]"
                  :error-messages="form.errors.name"
                />
              </VCol>

              <!-- 👉 Email -->
              <VCol
                cols="12"
                md="6"
              >
                <VTextField
                  v-model="form.email"
                  type="email"
                  :label="$t('Email')"
                  :rules="[rules.required, rules.email]"
                  :error-messages="form.errors.email"
                />
              </VCol>

              <!-- 👉 Username -->
              <VCol
                cols="12"
                md="6"
              >
                <VTextField
                  v-model="form.username"
                  :label="$t('Username')"
                  :rules="[rules.required]"
                  :error-messages="form.errors.username"
                />
              </VCol>

              <!-- 👉 Phone -->
              <VCol
                cols="12"
                md="6"
              >
                <VTextField
                  v-model="form.phone"
                  type="tel"
                  :label="$t('Phone Number')"
                  :rules="[rules.required]"
                  :error-messages="form.errors.phone"
                />
              </VCol>

              <!-- 👉 Website -->
              <VCol
                cols="12"
                md="6"
              >
                <VTextField
                  v-model="form.website"
                  type="url"
                  :label="$t('Website')"
                  :error-messages="form.errors.website"
                />
              </VCol>

              <!-- 👉 Language -->
              <VCol
                cols="12"
                md="6"
              >
                <VSelect
                  v-model="form.language"
                  :label="$t('Language')"
                  :items="languages"
                  :rules="[rules.required]"
                  :error-messages="form.errors.language"
                />
              </VCol>

              <!-- 👉 Country -->
              <VCol
                cols="12"
                md="6"
              >
                <VSelect
                  v-model="form.country"
                  :label="$t('Country')"
                  :items="countries"
                  :rules="[rules.required]"
                  :error-messages="form.errors.country"
                />
              </VCol>

              <!-- 👉 Currency -->
              <VCol
                cols="12"
                md="6"
              >
                <VSelect
                  v-model="form.currency"
                  :label="$t('Currency')"
                  :items="currencies"
                  :rules="[rules.required]"
                  :error-messages="form.errors.currency"
                />
              </VCol>

              <!-- 👉 Timezone -->
              <VCol
                cols="12"
                md="6"
              >
                <VSelect
                  v-model="form.timezone"
                  :label="$t('Timezone')"
                  :items="timeZones"
                  :menu-props="{ maxHeight: 200 }"
                />
              </VCol>

              <!-- 👉 Form Actions -->
              <VCol
                cols="12"
                class="d-flex flex-wrap gap-4"
              >
                <VBtn
                  type="submit"
                  :loading="form.processing"
                >
                  {{ $t('Save changes') }}
                </VBtn>

                <VBtn
                  color="secondary"
                  variant="tonal"
                  type="reset"
                  @click.prevent="form.reset()"
                >
                  {{ $t('Reset') }}
                </VBtn>
              </VCol>
            </VRow>
          </VForm>
        </VCardText>
      </VCard>
    </VCol>

    <VCol cols="12">
      <!-- 👉 Delete Account -->
      <VCard :title="$t('Deactivate Account')">
        <VCardText>
          <!-- 👉 Checkbox and Button  -->
          <VAlert
            color="warning"
            variant="tonal"
            class="mb-4"
          >
            <VAlertTitle class="mb-1">
              {{ $t('Are you sure you want to deactivate your account?') }}
            </VAlertTitle>
            <p class="mb-0">
              {{ $t('Once you deactivate your account, there is no going back. Please be certain.') }}
            </p>
          </VAlert>
          <div>
            <VCheckbox
              v-model="isAccountDeactivated"
              :rules="validateAccountDeactivation"
              :label="$t('I confirm my account deactivation')"
            />

            <VTextField
              v-if="isAccountDeactivated"
              v-model="confirmPassword"
              :label="$t('Confirm Password')"
              type="password"
              class="mt-3"
            />
          </div>

          <VBtn
            :disabled="!isAccountDeactivated || !confirmPassword || confirmPassword.length < 8"
            color="error"
            class="mt-3"
            @click="deactivateAccount"
          >
            {{ $t('Deactivate Account2') }}
          </VBtn>
        </VCardText>
      </VCard>
    </VCol>
  </VRow>
</template>
