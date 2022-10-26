<script setup>
import {useForm} from "@inertiajs/inertia-vue3"
import rules from '@/plugins/rules'
import {inject} from "vue"
import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'
import {useSnackbarStore} from "@/Stores/useSnackbarStore"

const props = defineProps({
  languages: {
    type: Object,
    required: true,
  },
})

const snackbarStore = useSnackbarStore()

const form = useForm({
  name: null,
  code: null,
  is_active: null,
  is_default: null,
})

function submit() {
  form.post(route('admin.settings.languages.store'),{
    onSuccess: page => {
      snackbarStore.showNotification(page)
    },
  })
}
</script>

<template>
  <AdminLayout
    :title="$t('Create Language')"
    :back="route('admin.settings.languages.index')"
  >
    <template #sub-navbar>
      <SettingsDrawerContent />
    </template>
    <VContainer>
      <VRow>
        <VCol
          cols="12"
          sm="6"
        >
          <VCard>
            <VCardTitle>{{ $t('Create Language') }}</VCardTitle>
            <VCardSubtitle>{{ $t('Here you can create new language') }}</VCardSubtitle>
            <VCardText>
              <VForm @submit.prevent="submit">
                <VSelect
                  v-model="form.name"
                  class="mb-5"
                  :label="$t('Language Name')"
                  :items="languages"
                  :error-messages="form.errors.name"
                  :rules="[rules.required]"
                  @update:modelValue="form.code = $event"
                />

                <VTextField
                  v-model="form.code"
                  class="mb-5"
                  :label="$t('Language Code')"
                  :rules="[rules.required]"
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
  </AdminLayout>
</template>
