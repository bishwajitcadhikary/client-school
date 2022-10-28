<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import rules from '@/plugins/rules'
import {inject} from "vue"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  language: {
    type: Object,
    required: true,
  },
})

const snackbarStore = useSnackbarStore()
const form = useForm({
  _method: "PUT",
  name: props.language.name,
  code: props.language.code,
  is_active: !!props.language.is_active,
  is_default: !!props.language.is_default,
})

function submit() {
  form.post(route('admin.settings.languages.update', {language: props.language.id}),{
    onSuccess: page => {
      snackbarStore.showNotification(page)
    },
  })
}
</script>

<template>
  <AppLayout
    :title="$t('Edit Language')"
    :back="route('admin.settings.languages.index')"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>

    <VContainer>
      <VRow justify="center">
        <VCol
          cols="12"
          sm="6"
        >
          <VCard>
            <VCardTitle>{{ $t('Edit Language') }}</VCardTitle>
            <VCardSubtitle>{{ $t('Here you can edit language information') }}</VCardSubtitle>
            <VCardText>
              <VForm @submit.prevent="submit">
                <VTextField
                  v-model="form.name"
                  class="mb-5"
                  :label="$t('Language Name')"
                  :error-messages="form.errors.name"
                  :rules="[rules.required]"
                />

                <VTextField
                  v-model="form.code"
                  class="mb-5"
                  :label="$t('Language Code')"
                  disabled
                />

                <VSwitch
                  v-model="form.is_active"
                  class="mb-5"
                  :label="$t('Active')"
                  :error-messages="form.errors.is_active"
                />

                <VSwitch
                  v-model="form.is_default"
                  class="mb-5"
                  :label="$t('Default')"
                  :error-messages="form.errors.is_default"
                />

                <VBtn
                  type="submit"
                  :loading="form.processing"
                >
                  <VIcon icon="mdi-content-save" />
                  {{ $t('Save') }}
                </VBtn>
              </VForm>
            </VCardText>
          </VCard>
        </VCol>
      </VRow>
    </VContainer>
  </AppLayout>
</template>
