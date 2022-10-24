<script setup>
import {useForm} from "@inertiajs/inertia-vue3"

import SettingsDrawerContent from '@/Pages/Admin/Settings/SettingsDrawerContent.vue'

const form = useForm({
  name: null,
})

function submit() {
  form.post(route('admin.settings.roles.store'))
}
</script>

<template>
  <AdminLayout
    :title="$t('Create Role')"
    :back="route('admin.settings.roles.index')"
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
            <VCardText>
              <VForm @submit.prevent="submit">
                <VCol
                  cols="12"
                >
                  <VTextField
                    v-model="form.name"
                    :label="$t('Name')"
                    :error-messages="form.errors.name"
                    outlined
                    dense
                  />
                </VCol>

                <VCol cols="12">
                  <VBtn
                    :loading="form.processing"
                    type="submit"
                    block
                  >
                    {{ $t('Submit') }}
                  </VBtn>
                </VCol>
              </VForm>
            </VCardText>
          </VCard>
        </VCol>
      </VRow>
    </VContainer>
  </AdminLayout>
</template>
