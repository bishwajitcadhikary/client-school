<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import rules from '@/plugins/rules'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

// Import FilePond
import vueFilePond from 'vue-filepond'

// Import plugins
// eslint-disable-next-line import/extensions
import FilePondPluginFileValidateType from 'filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.esm.js'
// eslint-disable-next-line import/extensions
import FilePondPluginImagePreview from 'filepond-plugin-image-preview/dist/filepond-plugin-image-preview.esm.js'

// Import styles
import 'filepond/dist/filepond.min.css'
import 'filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css'
import {trans} from "laravel-vue-i18n"

const props = defineProps({
  currencies: {
    type: Object,
    default: null,
  },
})

// Create FilePond component
const FilePond = vueFilePond(FilePondPluginFileValidateType, FilePondPluginImagePreview)
const snackbarStore = useSnackbarStore()

const form = useForm({
  avatar: null,
  name: null,
  username: null,
  email: null,
  phone: null,
  password: null,
  country: null,
  currency: null,
  website: null,
})

function submit() {
  form.post(route('admin.customers.store'),{
    onSuccess: page => {
      snackbarStore.showNotification(page)
    },
  })
}

function addAvatar(error, file) {
  if (error){
    snackbarStore.showSnackbar(trans('Something went wrong'))
  }else {
    form.avatar = file.file
  }
}
</script>

<template>
  <AdminLayout
    :title="$t('Create Customer')"
    :back="route('admin.customers.index')"
  >
    <VContainer>
      <VCard>
        <VCardTitle>{{ $t('Create Customer') }}</VCardTitle>
        <VCardSubtitle>{{ $t('Here you can create new customer') }}</VCardSubtitle>
        <VCardText>
          <VForm @submit.prevent="submit">
            <VRow>
              <VCol cols="2">
                <FilePond
                  ref="pond"
                  name="test"
                  class-name="my-pond"
                  :label-idle="$t('Browse or Drop Customer Photo')"
                  style-button-remove-item-position="bottom left"
                  style-button-process-item-position="bottom left"
                  style-load-indicator-position="bottom right"
                  style-progress-indicator-position="bottom right"
                  style-panel-layout="compact circle"
                  accepted-file-types="image/jpeg, image/png"
                  @addfile="addAvatar"
                  @removefile="form.avatar = null"
                />
              </VCol>
            </VRow>
            <VRow>
              <VCol
                cols="12"
                lg="4"
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
                lg="4"
                sm="6"
              >
                <VTextField
                  v-model="form.username"
                  :label="$t('Username')"
                  :rules="[rules.required]"
                  :error-messages="form.errors.username"
                />
              </VCol>

              <VCol
                cols="12"
                lg="4"
                sm="6"
              >
                <VTextField
                  v-model="form.email"
                  type="email"
                  :label="$t('Email')"
                  :rules="[rules.required]"
                  :error-messages="form.errors.email"
                />
              </VCol>

              <VCol
                cols="12"
                lg="4"
                sm="6"
              >
                <VTextField
                  v-model="form.phone"
                  type="tel"
                  :label="$t('Phone')"
                  :rules="[rules.required]"
                  :error-messages="form.errors.phone"
                />
              </VCol>

              <VCol
                cols="12"
                lg="4"
                sm="6"
              >
                <VTextField
                  v-model="form.password"
                  :label="$t('Password')"
                  :rules="[rules.required]"
                  :error-messages="form.errors.password"
                />
              </VCol>

              <VCol
                cols="12"
                lg="4"
                sm="6"
              >
                <VSelect
                  v-model="form.currency"
                  :items="currencies"
                  :label="$t('Currency')"
                  :rules="[rules.required]"
                  :error-messages="form.errors.currency"
                />
              </VCol>

              <VCol
                cols="12"
                lg="4"
                sm="6"
              >
                <VTextField
                  v-model="form.website"
                  :label="$t('Website')"
                  :error-messages="form.errors.website"
                  hint="https://example.com"
                />
              </VCol>

              <VCol cols="12">
                <VBtn
                  class="d-md-block"
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
